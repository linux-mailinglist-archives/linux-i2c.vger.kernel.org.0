Return-Path: <linux-i2c+bounces-1193-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4208B82615C
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jan 2024 20:55:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A49F5B2198A
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jan 2024 19:55:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79478F4E7;
	Sat,  6 Jan 2024 19:55:04 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5573EAF2;
	Sat,  6 Jan 2024 19:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf06.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay07.hostedemail.com (Postfix) with ESMTP id 9FF8B160218;
	Sat,  6 Jan 2024 19:54:55 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf06.hostedemail.com (Postfix) with ESMTPA id C942D20011;
	Sat,  6 Jan 2024 19:54:50 +0000 (UTC)
Message-ID: <f4d85d84c266f441b3768b1e05b8870e3d4a73a2.camel@perches.com>
Subject: Re: [PATCH v2 2/6] platform/x86: dell-smo8800: Move instantiation
 of lis3lv02d i2c_client from i2c-i801 to dell-smo8800
From: Joe Perches <joe@perches.com>
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
 Linus Torvalds <torvalds@linux-foundation.org>, Andreas Schwab
 <schwab@linux-m68k.org>, Steven Rostedt <rostedt@goodmis.org>
Cc: Pali =?ISO-8859-1?Q?Roh=E1r?= <pali@kernel.org>, Ilpo
 =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Paul Menzel
 <pmenzel@molgen.mpg.de>, Jean Delvare <jdelvare@suse.com>, Andi Shyti
 <andi.shyti@kernel.org>, eric.piel@tremplin-utc.net, Marius Hoch
 <mail@mariushoch.de>,  Dell.Client.Kernel@dell.com, Kai Heng Feng
 <kai.heng.feng@canonical.com>,  platform-driver-x86@vger.kernel.org,
 Wolfram Sang <wsa@kernel.org>,  linux-i2c@vger.kernel.org
Date: Sat, 06 Jan 2024 11:54:49 -0800
In-Reply-To: <ZZl-wrHfidYJwpOk@smile.fi.intel.com>
References: <20240106160935.45487-1-hdegoede@redhat.com>
	 <20240106160935.45487-3-hdegoede@redhat.com>
	 <ZZl-wrHfidYJwpOk@smile.fi.intel.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: C942D20011
X-Stat-Signature: 9pwmwekdbsq71csshaz8np8cw4yz9xic
X-Rspamd-Server: rspamout01
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/tL+JEdVcl3iQsTbVvl9CoefEJL8JWDqY=
X-HE-Tag: 1704570890-306529
X-HE-Meta: U2FsdGVkX1895CISb/zRp+MCsKU+xxwCHZQQurd+B1mrQ+2BcxJHiMkndl+nzyXofPUHw3U9rii5jDcxbUSvhwE53ILXyZ2QaV2YxMTDZdhwxzx1BJdT+OY/8eASJMHsytDDSLkUJsJOtRMJRzMweRuby3bU3FzdY01Cw4pw4b1eRorz5bssyKFe4To2v7FVkn94QPu592j7O7JSvDmnP6C7XcpA4Wd3+uwIoYijDb+y8ZzBdoaonKsWzdDMP6r/sXKiY14jTK6ENWv2Zphgxpqazqakqbt+iAT2gIzuNu6xYvTiaErEwugHVQjog1pV

On Sat, 2024-01-06 at 18:24 +0200, Andy Shevchenko wrote:
> + Cc people from tags of 72921427d46b ("string.h: Add str_has_prefix() he=
lper
> function"). See below why.
> > +	if (!strstarts(adap->name, "SMBus I801 adapter"))
> > +		return 0;
>=20
> Bah, we have str_has_prefix() and this, much older one...
> Steven? Others? I mean we can do something about this duplication, right?

coccinelle?

@@
expression a, b;
@@

-	strstarts(a, b)
+	str_has_prefix(a, b)


