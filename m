Return-Path: <linux-i2c+bounces-1704-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0455185360C
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Feb 2024 17:31:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8462F1F248E9
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Feb 2024 16:31:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A43E95DF01;
	Tue, 13 Feb 2024 16:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uIcIWYLI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kWY+0Hse";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QqUGbMwE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CB4v+WoG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24AD2919;
	Tue, 13 Feb 2024 16:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707841859; cv=none; b=LdKvbjekcHWu9STR/NUyovlCBS980sj34fJH4kWHvh25ElksTQ8nSvXykA3utydvicskqi8PD6Hhh3xiq14L6IHBVhtEILMgjCYKhGr/pDPdULDp/62mPzXZW+pRuEzkNhGm0A/bjjDnLAapHqf0/XQopPIZWEG+h+MXU3oRfGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707841859; c=relaxed/simple;
	bh=pbhl7o06F3KTdEXAEDM/E3x0i8cJOTf/7tGEm8pmAxM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DaLzd1erqqR4weVpQPPUnGEmysTPsQf64iSEqJQOrgtFXblbjqzpfkov821nyggu/OaZnnRrCf5lY6venwlrpOf6ic2oZvRms/rLkI33MgMarCmH5KLxoN8v0p5pey2ghmBdS/FuEMUQqR3Z4wdKQPy7eMMNRnHae7Gm1S3Fk4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uIcIWYLI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kWY+0Hse; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QqUGbMwE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CB4v+WoG; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id ED9D01FCEE;
	Tue, 13 Feb 2024 16:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707841856; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rh0WxZGNI+843mgcC/hg4m0gdTkh1X753D3mIWPc/T0=;
	b=uIcIWYLIxt1HSVZMzrKH3J718SpoxUkGptoIOidcIswBpUWSLvqsqbwoHgA2a+MhG0gNCL
	Wc0it7dUHWvkd65MPigcU3hlq9fFfQyjJEMDeGPlWUZ+KK8QQHRn18g1YCTG2l5rPtZ7C0
	F7AQ8+knys5ZEvUq4Ac4y0nPH7BuVI0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707841856;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rh0WxZGNI+843mgcC/hg4m0gdTkh1X753D3mIWPc/T0=;
	b=kWY+0HsedNUZbDVyu6uhbAqulFcybaWCrt8IYNiuHV9k+22P3cy63h79iHuJnb1BiRnCff
	ew0LIlA6e5+u1SBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707841855; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rh0WxZGNI+843mgcC/hg4m0gdTkh1X753D3mIWPc/T0=;
	b=QqUGbMwEjiPpN7eYvfAE6ZG1wZcJJVVjRSHlnC5hDbLmgY809hZH6HT/84X4oqcntAlDqc
	WCFc8Mfi7pVoPxkmNo2zP16p3SpGXNdjfFW4ySPPgU3EhFqEI7beC3LFBahplR2Ovjc77N
	dVls44s5d4n2rCDa0WYl/o33RGQZcrk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707841855;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rh0WxZGNI+843mgcC/hg4m0gdTkh1X753D3mIWPc/T0=;
	b=CB4v+WoGzcv8d9cMvW6dhwB9pwFL2p6Xw+cX1PS06FrfqIryC7dKl3cZybKDucV0pvVUK0
	o5m0LcHyxvBpTQBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3AC79136F5;
	Tue, 13 Feb 2024 16:30:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id E1KYBz6Zy2UpUwAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Tue, 13 Feb 2024 16:30:54 +0000
Date: Tue, 13 Feb 2024 17:30:50 +0100
From: Jean Delvare <jdelvare@suse.de>
To: Pali =?UTF-8?B?Um9ow6Fy?= <pali@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>, Ilpo =?UTF-8?B?SsOkcnZpbmVu?=
 <ilpo.jarvinen@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, Paul
 Menzel <pmenzel@molgen.mpg.de>, Andi Shyti <andi.shyti@kernel.org>,
 eric.piel@tremplin-utc.net, Marius Hoch <mail@mariushoch.de>,
 Dell.Client.Kernel@dell.com, Kai Heng Feng <kai.heng.feng@canonical.com>,
 platform-driver-x86@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
 linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 2/6] platform/x86: dell-smo8800: Move instantiation
 of lis3lv02d i2c_client from i2c-i801 to dell-smo8800
Message-ID: <20240213173050.0cf4a58f@endymion.delvare>
In-Reply-To: <20240107171055.ac7jtwhu2kbalaou@pali>
References: <20240106160935.45487-1-hdegoede@redhat.com>
	<20240106160935.45487-3-hdegoede@redhat.com>
	<20240107171055.ac7jtwhu2kbalaou@pali>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -1.45
X-Spamd-Result: default: False [-1.45 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 HAS_ORG_HEADER(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCPT_COUNT_TWELVE(0.00)[13];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.15)[68.96%]
X-Spam-Flag: NO

Hi Pali, Hans,

On Sun, 7 Jan 2024 18:10:55 +0100, Pali Roh=C3=A1r wrote:
> On Saturday 06 January 2024 17:09:29 Hans de Goede wrote:
> > It is not necessary to handle the Dell specific instantiation of
> > i2c_client-s for SMO8xxx ACPI devices without an ACPI I2cResource
> > inside the generic i801 I2C adapter driver.
> >=20
> > The kernel already instantiates platform_device-s for these ACPI devices
> > and the drivers/platform/x86/dell/dell-smo8800.c driver binds to these
> > platform drivers.
> >=20
> > Move the i2c_client instantiation from the generic i2c-i801 driver to
> > the Dell specific dell-smo8800 driver.
> >=20
> > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> > ---
> > Changes in v2:
> > - Use a pci_device_id table to check for IDF (non main) i2c-i801 SMBuss=
es
> > - Add a comment documenting the IDF PCI device ids
> > ---
> >  drivers/i2c/busses/i2c-i801.c            | 126 +----------------------
> >  drivers/platform/x86/dell/dell-smo8800.c | 121 +++++++++++++++++++++-
> >  2 files changed, 123 insertions(+), 124 deletions(-) =20
>=20
> I'm looking at this change again and I'm not not sure if it is a good
> direction to do this movement. (...)

Same feeling here. Having to lookup the parent i2c bus, which may or
may not be present yet, doesn't feel good.

I wouldn't object if everybody was happy with the move and moving the
code was solving an actual issue, but that doesn't seem to be the case.

--=20
Jean Delvare
SUSE L3 Support

