Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D33A9F7E59
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Nov 2019 20:03:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727183AbfKKTDN convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Mon, 11 Nov 2019 14:03:13 -0500
Received: from mx2.suse.de ([195.135.220.15]:60444 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727224AbfKKTDN (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 11 Nov 2019 14:03:13 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 24006B19F;
        Mon, 11 Nov 2019 19:03:10 +0000 (UTC)
Date:   Mon, 11 Nov 2019 20:03:08 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     =?UTF-8?B?T25kxZllaiBMeXNvbsSbaw==?= <olysonek@redhat.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH i2c-tools] tools: Load the i2c-dev kernel module when
 needed
Message-ID: <20191111200308.256bb9db@endymion>
In-Reply-To: <20191107140006.14413-1-olysonek@redhat.com>
References: <20191107140006.14413-1-olysonek@redhat.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Ondřej,

On Thu,  7 Nov 2019 15:00:06 +0100, Ondřej Lysoněk wrote:
> The i2c-dev kernel module is necessary to access I2C adapters from
> userspace, so it's needed by all the I2C tools. The module is not
> loaded automatically, so when e.g. i2cdetect is run without i2c-dev
> loaded, it gives a false impression that no I2C adapters exist, which
> is not very user-friendly:
> 
>  # i2cdetect -l
>  # modprobe i2c-dev
>  # i2cdetect -l
> i2c-0	i2c       	i915 gmbus ssc                  	I2C adapter
> i2c-1	i2c       	i915 gmbus vga                  	I2C adapter
> i2c-2	i2c       	i915 gmbus panel                	I2C adapter
> i2c-3	i2c       	i915 gmbus dpc                  	I2C adapter
> i2c-4	i2c       	i915 gmbus dpb                  	I2C adapter
> i2c-5	i2c       	i915 gmbus dpd                  	I2C adapter
> i2c-6	i2c       	DPDDC-C                         	I2C adapter
> i2c-7	i2c       	DPDDC-D                         	I2C adapter

Yeah, I agree, I meant to do this for a long time, actually I have a
proof-of-concept patch for this on my disk from 2006 :-(

> This patch makes all the tools autoload i2c-dev when needed. The code
> to load the module is compiled in only if libkmod is present on the
> system.

What is the added value of libkmod here? I mean, how is this any better
than:

	system("modprobe i2c-dev");

which is what my patch was doing?

> This resolves the following Fedora bug:
> https://bugzilla.redhat.com/show_bug.cgi?id=913203
> 
> The patch is based on a previous version of the patch by Michal Minar,
> posted on linux-i2c some time ago:
> https://marc.info/?l=linux-i2c&m=140195625915505&w=2
> 
> The patch is also inspired by the GPLv2+ modprobe from kmod.
> 
> Signed-off-by: Ondřej Lysoněk <olysonek@redhat.com>
> ---
>  tools/Module.mk   | 11 +++++-
>  tools/i2cbusses.c | 97 +++++++++++++++++++++++++++++++++++++++++------
>  2 files changed, 95 insertions(+), 13 deletions(-)
> 
> diff --git a/tools/Module.mk b/tools/Module.mk
> index 693102f..17ef8d4 100644
> --- a/tools/Module.mkles joues
> +++ b/tools/Module.mk
> @@ -12,10 +12,17 @@ TOOLS_DIR	:= tools
>  TOOLS_CFLAGS	:= -Wstrict-prototypes -Wshadow -Wpointer-arith -Wcast-qual \
>  		   -Wcast-align -Wwrite-strings -Wnested-externs -Winline \
>  		   -W -Wundef -Wmissing-prototypes -Iinclude
> +TOOLS_LDFLAGS	:=
> +
> +ifeq ($(shell pkg-config --exists libkmod && echo 1), 1)
> +TOOLS_CFLAGS	+= $(shell pkg-config --cflags libkmod) -DUSE_LIBKMOD
> +TOOLS_LDFLAGS	+= $(shell pkg-config --libs libkmod)
> +endif
> +
>  ifeq ($(USE_STATIC_LIB),1)
> -TOOLS_LDFLAGS	:= $(LIB_DIR)/$(LIB_STLIBNAME)
> +TOOLS_LDFLAGS	+= $(LIB_DIR)/$(LIB_STLIBNAME)
>  else
> -TOOLS_LDFLAGS	:= -L$(LIB_DIR) -li2c
> +TOOLS_LDFLAGS	+= -L$(LIB_DIR) -li2c
>  endif
>  
>  TOOLS_TARGETS	:= i2cdetect i2cdump i2cset i2cget i2ctransfer
> diff --git a/tools/i2cbusses.c b/tools/i2cbusses.c
> index b4f00ae..5f3ad42 100644
> --- a/tools/i2cbusses.c
> +++ b/tools/i2cbusses.c
> @@ -43,6 +43,14 @@
>  #include <linux/i2c.h>
>  #include <linux/i2c-dev.h>
>  
> +#ifdef USE_LIBKMOD
> +#include <libkmod.h>
> +
> +#define I2C_DEV_MOD_NAME "i2c_dev"
> +#define MODULE_LOAD_ERR_MSG "Error: Failed to load required " \
> +                             I2C_DEV_MOD_NAME " kernel module: "
> +#endif
> +
>  enum adt { adt_dummy, adt_isa, adt_i2c, adt_smbus, adt_unknown };
>  
>  struct adap_type {
> @@ -63,6 +71,61 @@ static struct adap_type adap_types[5] = {
>  	  .algo		= "N/A", },
>  };
>  
> +
> +/**
> + * Try to load the i2c_dev kernel module.
> + * Returns 1 on success, 0 otherwise.
> + */
> +static int load_i2c_dev_module(int quiet) {
> +	int ret = 0;
> +#ifdef USE_LIBKMOD
> +	int flags = 0;
> +	struct kmod_ctx *ctx;
> +	struct kmod_list *l, *list = NULL;
> +
> +	ctx = kmod_new(NULL, NULL);
> +	if (!ctx) {
> +		if (!quiet)
> +			fprintf(stderr,
> +				MODULE_LOAD_ERR_MSG "kmod_new() failed\n");
> +		goto out;
> +	}
> +	if (kmod_module_new_from_lookup(ctx, I2C_DEV_MOD_NAME, &list) < 0
> +	    || list == NULL) {
> +		if (!quiet)
> +			fprintf(stderr, MODULE_LOAD_ERR_MSG
> +				I2C_DEV_MOD_NAME " module lookup failed\n");
> +		goto ctx_unref;
> +	}
> +
> +	flags |= KMOD_PROBE_APPLY_BLACKLIST_ALIAS_ONLY;
> +	kmod_list_foreach(l, list) {
> +		struct kmod_module *mod = kmod_module_get_module(l);
> +		int res;
> +		res = kmod_module_probe_insert_module(mod, flags, NULL, NULL,
> +		                                      NULL, NULL);
> +		ret = (res >= 0);
> +		if (res == -ENOENT && !quiet) {
> +			fprintf(stderr, MODULE_LOAD_ERR_MSG
> +			        "unknown symbol in module \"%s\", or unknown parameter (see dmesg)\n",
> +			        kmod_module_get_name(mod));
> +		} else if (res < 0 && !quiet) {
> +			fprintf(stderr, MODULE_LOAD_ERR_MSG "(module %s): %s\n",
> +			        kmod_module_get_name(mod), strerror(-res));
> +		}
> +		kmod_module_unref(mod);
> +	}
> +
> +	kmod_module_unref_list(list);
> +ctx_unref:
> +	kmod_unref(ctx);
> +out:
> +#else
> +	(void) quiet;
> +#endif
> +	return ret;
> +}
> +
>  static enum adt i2c_get_funcs(int i2cbus)
>  {
>  	unsigned long funcs;
> @@ -209,8 +272,12 @@ struct i2c_adap *gather_i2c_busses(void)
>  	   i2c-dev and what we really care about are the i2c-dev numbers.
>  	   Unfortunately the names are harder to get in i2c-dev */
>  	strcat(sysfs, "/class/i2c-dev");
> -	if(!(dir = opendir(sysfs)))
> -		goto done;
> +	if(!(dir = opendir(sysfs))) {
> +		if (!load_i2c_dev_module(0))
> +			goto done;
> +		if ((!(dir = opendir(sysfs))))
> +			goto done;
> +	}
>  	/* go through the busses */
>  	while ((de = readdir(dir)) != NULL) {
>  		if (!strcmp(de->d_name, "."))
> @@ -407,21 +474,29 @@ int parse_i2c_address(const char *address_arg, int all_addrs)
>  int open_i2c_dev(int i2cbus, char *filename, size_t size, int quiet)
>  {
>  	int file, len;
> +	int i;
>  
> -	len = snprintf(filename, size, "/dev/i2c/%d", i2cbus);
> -	if (len >= (int)size) {
> -		fprintf(stderr, "%s: path truncated\n", filename);
> -		return -EOVERFLOW;
> -	}
> -	file = open(filename, O_RDWR);
> -
> -	if (file < 0 && (errno == ENOENT || errno == ENOTDIR)) {
> -		len = snprintf(filename, size, "/dev/i2c-%d", i2cbus);
> +	for (i = 0; i < 2; ++i) {

Sorry, what are you doing here?

> +		len = snprintf(filename, size, "/dev/i2c/%d", i2cbus);
>  		if (len >= (int)size) {
>  			fprintf(stderr, "%s: path truncated\n", filename);
>  			return -EOVERFLOW;
>  		}
>  		file = open(filename, O_RDWR);
> +
> +		if (file < 0 && (errno == ENOENT || errno == ENOTDIR)) {
> +			len = snprintf(filename, size, "/dev/i2c-%d", i2cbus);
> +			if (len >= (int)size) {
> +				fprintf(stderr, "%s: path truncated\n", filename);
> +				return -EOVERFLOW;
> +			}
> +			file = open(filename, O_RDWR);
> +		}
> +
> +		if (file >= 0 || (errno != ENOENT && errno != ENOTDIR))
> +			break;
> +		if (i > 0 || !load_i2c_dev_module(quiet))
> +			break;
>  	}
>  
>  	if (file < 0 && !quiet) {


-- 
Jean Delvare
SUSE L3 Support
