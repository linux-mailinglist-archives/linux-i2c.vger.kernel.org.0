Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A904F8D2B
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Nov 2019 11:48:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726936AbfKLKsG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 Nov 2019 05:48:06 -0500
Received: from mx2.suse.de ([195.135.220.15]:53250 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725834AbfKLKsG (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 12 Nov 2019 05:48:06 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id BC4CCAC2E;
        Tue, 12 Nov 2019 10:48:03 +0000 (UTC)
Message-ID: <1573555682.5312.3.camel@suse.de>
Subject: Re: [PATCH i2c-tools] tools: Load the i2c-dev kernel module when
 needed
From:   Jean Delvare <jdelvare@suse.de>
To:     =?UTF-8?Q?Ond=C5=99ej_Lyson=C4=9Bk?= <olysonek@redhat.com>
Cc:     linux-i2c@vger.kernel.org
Date:   Tue, 12 Nov 2019 11:48:02 +0100
In-Reply-To: <fls4kz9xy4q.fsf@redhat.com>
References: <20191107140006.14413-1-olysonek@redhat.com>
         <20191111200308.256bb9db@endymion> <fls4kz9xy4q.fsf@redhat.com>
Organization: Suse Linux
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 2019-11-12 at 10:05 +0100, Ondřej Lysoněk wrote:
> Jean Delvare <jdelvare@suse.de> writes:
> > On Thu,  7 Nov 2019 15:00:06 +0100, Ondřej Lysoněk wrote:
> > > This patch makes all the tools autoload i2c-dev when needed. The code
> > > to load the module is compiled in only if libkmod is present on the
> > > system.
> > 
> > What is the added value of libkmod here? I mean, how is this any better
> > than:
> > 
> > 	system("modprobe i2c-dev");
> > 
> > which is what my patch was doing?
> 
> Using libkmod should be faster as it avoids executing the shell and then
> modprobe. I could use system("modprobe i2c-dev") in the #else branch
> when libkmod is not available, though.

Michal's patch was doing that, and I think it makes sense, as I'd
rather not depend on the presence of libkmod for the feature itself. I
would like to be able to document "the i2c-dev module will be loaded as
needed" without having to explain in which case this will actually work
and in which case it won't. Doesn't matter if it's slower without
libkmod - that does not need to be documented.

> > > This resolves the following Fedora bug:
> > > https://bugzilla.redhat.com/show_bug.cgi?id=913203
> > > 
> > > The patch is based on a previous version of the patch by Michal Minar,
> > > posted on linux-i2c some time ago:
> > > https://marc.info/?l=linux-i2c&m=140195625915505&w=2
> > > 
> > > The patch is also inspired by the GPLv2+ modprobe from kmod.
> > > 
> > > Signed-off-by: Ondřej Lysoněk <olysonek@redhat.com>
> > > ---
> > >  tools/Module.mk   | 11 +++++-
> > >  tools/i2cbusses.c | 97 +++++++++++++++++++++++++++++++++++++++++------
> > >  2 files changed, 95 insertions(+), 13 deletions(-)
> > >  (...)
> > > +/**
> > > + * Try to load the i2c_dev kernel module.
> > > + * Returns 1 on success, 0 otherwise.
> > > + */

A rather unusual convention. Any reason why you opted for that rather
that the usual 0 on success / -errno on error?

> > > +static int load_i2c_dev_module(int quiet) {
> > > +	int ret = 0;
> > > +#ifdef USE_LIBKMOD
> > > +	int flags = 0;
> > > +	struct kmod_ctx *ctx;
> > > +	struct kmod_list *l, *list = NULL;
> > > +
> > > +	ctx = kmod_new(NULL, NULL);
> > > +	if (!ctx) {
> > > +		if (!quiet)
> > > +			fprintf(stderr,
> > > +				MODULE_LOAD_ERR_MSG "kmod_new() failed\n");
> > > +		goto out;
> > > +	}
> > > +	if (kmod_module_new_from_lookup(ctx, I2C_DEV_MOD_NAME, &list) < 0
> > > +	    || list == NULL) {
> > > +		if (!quiet)
> > > +			fprintf(stderr, MODULE_LOAD_ERR_MSG
> > > +				I2C_DEV_MOD_NAME " module lookup failed\n");
> > > +		goto ctx_unref;
> > > +	}
> > > +
> > > +	flags |= KMOD_PROBE_APPLY_BLACKLIST_ALIAS_ONLY;
> > > +	kmod_list_foreach(l, list) {

I must say I'm surprised this is a list, I thought module names had to
be unique?

> > > +		struct kmod_module *mod = kmod_module_get_module(l);
> > > +		int res;
> > > +		res = kmod_module_probe_insert_module(mod, flags, NULL, NULL,
> > > +		                                      NULL, NULL);
> > > +		ret = (res >= 0);

Mixing "ret" and "res" in the same function is asking for trouble. Do
you really need two variables?

> > > +		if (res == -ENOENT && !quiet) {
> > > +			fprintf(stderr, MODULE_LOAD_ERR_MSG
> > > +			        "unknown symbol in module \"%s\", or unknown parameter (see dmesg)\n",
> > > +			        kmod_module_get_name(mod));
> > > +		} else if (res < 0 && !quiet) {
> > > +			fprintf(stderr, MODULE_LOAD_ERR_MSG "(module %s): %s\n",
> > > +			        kmod_module_get_name(mod), strerror(-res));
> > > +		}
> > > +		kmod_module_unref(mod);

Are we guaranteed that the driver probing has completed at this point?
I mean, the kernel sends events for udev to process and the actual /dev
nodes are created by udev asynchronously as I understand it. Don't we
need an equivalent of "udevadm settle" here?

> > > +	}
> > > +
> > > +	kmod_module_unref_list(list);
> > > +ctx_unref:
> > > +	kmod_unref(ctx);
> > > +out:
> > > +#else
> > > +	(void) quiet;
> > > +#endif
> > > +	return ret;
> > > +}
> > > +
> > >  static enum adt i2c_get_funcs(int i2cbus)
> > >  {
> > >  	unsigned long funcs;
> > > @@ -209,8 +272,12 @@ struct i2c_adap *gather_i2c_busses(void)
> > >  	   i2c-dev and what we really care about are the i2c-dev numbers.
> > >  	   Unfortunately the names are harder to get in i2c-dev */
> > >  	strcat(sysfs, "/class/i2c-dev");
> > > -	if(!(dir = opendir(sysfs)))
> > > -		goto done;
> > > +	if(!(dir = opendir(sysfs))) {
> > > +		if (!load_i2c_dev_module(0))
> > > +			goto done;
> > > +		if ((!(dir = opendir(sysfs))))
> > > +			goto done;
> > > +	}
> > >  	/* go through the busses */
> > >  	while ((de = readdir(dir)) != NULL) {
> > >  		if (!strcmp(de->d_name, "."))
> > > @@ -407,21 +474,29 @@ int parse_i2c_address(const char *address_arg, int all_addrs)
> > >  int open_i2c_dev(int i2cbus, char *filename, size_t size, int quiet)
> > >  {
> > >  	int file, len;
> > > +	int i;
> > >  
> > > -	len = snprintf(filename, size, "/dev/i2c/%d", i2cbus);
> > > -	if (len >= (int)size) {
> > > -		fprintf(stderr, "%s: path truncated\n", filename);
> > > -		return -EOVERFLOW;
> > > -	}
> > > -	file = open(filename, O_RDWR);
> > > -
> > > -	if (file < 0 && (errno == ENOENT || errno == ENOTDIR)) {
> > > -		len = snprintf(filename, size, "/dev/i2c-%d", i2cbus);
> > > +	for (i = 0; i < 2; ++i) {
> > 
> > Sorry, what are you doing here?
> 
> I'm attempting to load /dev/i2c/%d or /dev/i2c-%d. If none of them
> exist, I load the i2c-dev module and try again. Perhaps it would be
> clearer if I used goto instead of the for loop. Or move opening the
> files to a separate function.

I think I would rename open_i2c_dev to static __open_i2c_dev or
similar, and then add (untested):

int open_i2c_dev(int i2cbus, char *filename, size_t size, int quiet)
{
	int file;

	file = __open_i2c_dev(i2cbus, filename, size, quiet);
	if (file < 0 && load_i2c_dev_module(quiet))
		file = __open_i2c_dev(i2cbus, filename, size, quiet);

	return file;
}

This avoids the extra indentation or the goto, and seems neater
overall. I don't think we care about the slight performance penalty.
What do you think?

Thanks,
-- 
Jean Delvare
SUSE L3 Support
