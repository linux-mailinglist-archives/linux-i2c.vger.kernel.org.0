Return-Path: <linux-i2c+bounces-1196-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C24E08264EA
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Jan 2024 17:08:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB5241C21491
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Jan 2024 16:08:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1C9B134DE;
	Sun,  7 Jan 2024 16:08:07 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FAE313AC0;
	Sun,  7 Jan 2024 16:08:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 499D6C433C7;
	Sun,  7 Jan 2024 16:08:05 +0000 (UTC)
Date: Sun, 7 Jan 2024 11:09:17 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>, Linus Torvalds
 <torvalds@linux-foundation.org>, Joe Perches <joe@perches.com>, Andreas
 Schwab <schwab@linux-m68k.org>, Pali =?UTF-8?B?Um9ow6Fy?=
 <pali@kernel.org>, Ilpo =?UTF-8?B?SsOkcnZpbmVu?=
 <ilpo.jarvinen@linux.intel.com>, Paul Menzel <pmenzel@molgen.mpg.de>, Jean
 Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
 eric.piel@tremplin-utc.net, Marius Hoch <mail@mariushoch.de>,
 Dell.Client.Kernel@dell.com, Kai Heng Feng <kai.heng.feng@canonical.com>,
 platform-driver-x86@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
 linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 2/6] platform/x86: dell-smo8800: Move instantiation
 of lis3lv02d i2c_client from i2c-i801 to dell-smo8800
Message-ID: <20240107110917.3d6075de@gandalf.local.home>
In-Reply-To: <ZZl-wrHfidYJwpOk@smile.fi.intel.com>
References: <20240106160935.45487-1-hdegoede@redhat.com>
	<20240106160935.45487-3-hdegoede@redhat.com>
	<ZZl-wrHfidYJwpOk@smile.fi.intel.com>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 6 Jan 2024 18:24:34 +0200
Andy Shevchenko <andy@kernel.org> wrote:

> > +	if (!strstarts(adap->name, "SMBus I801 adapter"))
> > +		return 0;  
> 
> Bah, we have str_has_prefix() and this, much older one...
> Steven? Others? I mean we can do something about this duplication, right?

They are not really duplicate functions.

Note that strstarts() is just a boolean (does this start with something)
where as str_has_prefix() returns the length of the prefix.

Yes, strstarts() can be swapped to str_has_prefix() but it can't go the
other way around. One use case of the str_has_prefix() feature is in the
histogram parsing:

	for (i = 0; i < hist_data->attrs->n_actions; i++) {
		str = hist_data->attrs->action_str[i];

		if ((len = str_has_prefix(str, "onmatch("))) {
			char *action_str = str + len;

			data = onmatch_parse(tr, action_str);
			if (IS_ERR(data)) {
				ret = PTR_ERR(data);
				break;
			}
		} else if ((len = str_has_prefix(str, "onmax("))) {
			char *action_str = str + len;

			data = track_data_parse(hist_data, action_str,
						HANDLER_ONMAX);
			if (IS_ERR(data)) {
				ret = PTR_ERR(data);
				break;
			}
		} else if ((len = str_has_prefix(str, "onchange("))) {
			char *action_str = str + len;

			data = track_data_parse(hist_data, action_str,
						HANDLER_ONCHANGE);
			if (IS_ERR(data)) {
				ret = PTR_ERR(data);
				break;
			}

Where we get the length of the prefix if there's a match, and use that to
skip over the prefix.

If you just need to know if something starts with a string, then
"strstarts()" is perfectly fine to use.

-- Steve

