PREFIX=/usr
MANDIR=$(PREFIX)/share/man
BINDIR=$(PREFIX)/bin

all:
		@echo "Run 'make install' for installation."
		@echo "Run 'make uninstall' for uninstallation."
install:
		@echo "Creating A vesht shell. This shell uses C's pthread and system functions"
		@sleep 2
		@echo "\n\n"
		gcc -pthread -o vesht shell_thread.c
		@sleep 2
		@echo "\n\n"
		@echo "Creating A veshf shell. This shell uses C's fork and execl family functions"
		gcc -o veshf shell_fork.c
		@sleep 2
		@echo "\n\n"
		@echo "Creating A veshls shell. This shell uses C's fork and execl family functions to execute ls command"
		gcc -o veshls ls_.c
		@sleep 2
		@echo "\n\n"
		@echo "Installing shells in your system"
		install -Dm755 veshls $(DESTDIR)$(BINDIR)/veshls
		install -Dm755 veshf $(DESTDIR)$(BINDIR)/veshf
		install -Dm755 vesht $(DESTDIR)$(BINDIR)/vesht
		@sleep 2
		@echo "Removing executables from this directory."
		rm -f vesh*
		@sleep 2
		@echo "\n\n"
		@echo "DONE. Run either vesht, veshf or veshls to lauch your shells"
uninstall:
		rm -f $(DESTDIR)$(BINDIR)/veshls
		rm -f $(DESTDIR)$(BINDIR)/veshf
		rm -f $(DESTDIR)$(BINDIR)/vesht
