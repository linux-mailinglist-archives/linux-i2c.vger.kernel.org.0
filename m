Return-Path: <linux-i2c+bounces-1706-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 760FD853D5A
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Feb 2024 22:40:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C0BB28E06E
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Feb 2024 21:40:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B832761682;
	Tue, 13 Feb 2024 21:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CG5OjAY8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3eI7Vgg9";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Jh56rXSt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="T7+nWStY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9776E61669;
	Tue, 13 Feb 2024 21:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707860358; cv=none; b=R/YMmEqRPKduJNw9KNt1Vv4+Nhke45vICGMrJ2b8rOHZ39ulA4tu/1K/L0rZCTwPAUJ6E7oK858UEQhX2Md+9eJvjqWddbiAmWjZPVy87Dl91Y18wmNIDXte9x0yWL34y4lhtSna7C5pL2wJDI1JyFLvPtDMD+zq/pQkI7hADpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707860358; c=relaxed/simple;
	bh=BUAr3sBqzq/mIhmYqhWP/6DEipOWW5FMJ0P2Le+dOos=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DHxK3Mud+qpha+MB+/9IOWR8mr/ra3OrewXWRV7Zxv3lUSSLJ2WMWbpYKTSn32B+bI63SAwS03SVic4TeoR9SMnCdKQbkyR2Qgzr4MXi1shSZ6OmkfjNdgtsD5t+FqQQojydUfd0lQinmQyTJrUppg1hRbkBSRdjr8Ex0rbqo9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CG5OjAY8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3eI7Vgg9; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Jh56rXSt; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=T7+nWStY; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7A9E92212F;
	Tue, 13 Feb 2024 21:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707860354; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dTiPPmHDw2aZAXgldAitJ1VDBOydclpHipfi4Efd+uU=;
	b=CG5OjAY81AO9CnJJAtnesw5zPIc79sj4Fe8+R8Yo3Gwe95bWPbcOvTWooQvAG3Gw7283f6
	AD8LWr1cjrfySghnGvLknGePBFgx1GXwquDVFWWw3KzV1UexbmAzFAqsG9ag3NmfvBDas/
	z66wPZHaN7MVRuPEy7js0VPAGRKa2f8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707860354;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dTiPPmHDw2aZAXgldAitJ1VDBOydclpHipfi4Efd+uU=;
	b=3eI7Vgg9TOCwpoU123vWAup+/YF9/lGDVBVSiMJHXH7SC/KLKaASnd/2cr5V1zKJpRg+iK
	02gjDHGZ8qCE5dBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707860353; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dTiPPmHDw2aZAXgldAitJ1VDBOydclpHipfi4Efd+uU=;
	b=Jh56rXStMSm4uiLr+Ly4+66CE77knqnOzeFbyC6SfD5CDcfRODrUN6GeXDfJcQUXcB2U74
	Pz20djMRl7FeoWBMgx+xU8ETDu3Sxr7NNu13J5dsbpa2+R4G7+Spm3oFo0IyXhBDL+7gz8
	Y/adp1HkkIBKm+ZBefiHXUMNXj9EZMM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707860353;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dTiPPmHDw2aZAXgldAitJ1VDBOydclpHipfi4Efd+uU=;
	b=T7+nWStY/NnsxwQHVTBCTEU5mF/3aKc/5vfsfvbZNkdUdXrFF/dQ/qLkV06/c6+y9mCVwA
	m419U2pMxk64p3Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 352E3136F5;
	Tue, 13 Feb 2024 21:39:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8Ao0BoDhy2XzGwAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Tue, 13 Feb 2024 21:39:12 +0000
Date: Tue, 13 Feb 2024 22:39:08 +0100
From: Jean Delvare <jdelvare@suse.de>
To: Mateusz =?UTF-8?B?Sm/FhGN6eWs=?= <mat.jonczyk@o2.pl>
Cc: linux-pci@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, Bjorn Helgaas
 <bhelgaas@google.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown
 <lenb@kernel.org>, Borislav Petkov <bp@suse.de>
Subject: Re: [PATCH v4] acpi,pci: warn about duplicate IRQ routing entries
 returned from _PRT
Message-ID: <20240213223908.435aec7b@endymion.delvare>
In-Reply-To: <20231226124254.66102-1-mat.jonczyk@o2.pl>
References: <20231226124254.66102-1-mat.jonczyk@o2.pl>
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
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Jh56rXSt;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=T7+nWStY
X-Spamd-Result: default: False [-3.31 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 HAS_ORG_HEADER(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 TO_MATCH_ENVRCPT_SOME(0.00)[];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 RCPT_COUNT_SEVEN(0.00)[9];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:url,suse.de:dkim,suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 7A9E92212F
X-Spam-Level: 
X-Spam-Score: -3.31
X-Spam-Flag: NO

Hi Mateusz,

On Tue, 26 Dec 2023 13:42:54 +0100, Mateusz Jo=C5=84czyk wrote:
> On some platforms, the ACPI _PRT function returns duplicate interrupt
> routing entries. Linux uses the first matching entry, but sometimes the
> second matching entry contains the correct interrupt vector.
>=20
> As a debugging aid, print a warning to dmesg if duplicate interrupt
> routing entries are present. This way, we could check how many models
> are affected.
>=20
> This happens on a Dell Latitude E6500 laptop with the i2c-i801 Intel
> SMBus controller. This controller is nonfunctional unless its interrupt
> usage is disabled (using the "disable_features=3D0x10" module parameter).
>=20
> After investigation, it turned out that the driver was using an
> incorrect interrupt vector: in lspci output for this device there was:
>         Interrupt: pin B routed to IRQ 19
> but after running i2cdetect (without using any i2c-i801 module
> parameters) the following was logged to dmesg:
>=20
>         [...]
>         i801_smbus 0000:00:1f.3: Timeout waiting for interrupt!
>         i801_smbus 0000:00:1f.3: Transaction timeout
>         i801_smbus 0000:00:1f.3: Timeout waiting for interrupt!
>         i801_smbus 0000:00:1f.3: Transaction timeout
>         irq 17: nobody cared (try booting with the "irqpoll" option)
>=20
> Existence of duplicate entries in a table returned by the _PRT method
> was confirmed by disassembling the ACPI DSDT table.
>=20
> Windows XP is using IRQ3 (as reported by HWiNFO32 and in the Device
> Manager), which is neither of the two vectors returned by _PRT.
> As HWiNFO32 decoded contents of the SPD EEPROMs, the i2c-i801 device is
> working under Windows. It appears that Windows has reconfigured the
> chipset independently to use another interrupt vector for the device.
> This is possible, according to the chipset datasheet [1], page 436 for
> example (PIRQ[n]_ROUT=E2=80=94PIRQ[A,B,C,D] Routing Control Register).
>=20
> [1] https://www.intel.com/content/dam/doc/datasheet/io-controller-hub-9-d=
atasheet.pdf
>=20
> Signed-off-by: Mateusz Jo=C5=84czyk <mat.jonczyk@o2.pl>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Len Brown <lenb@kernel.org>
> Cc: Borislav Petkov <bp@suse.de>
> Cc: Jean Delvare <jdelvare@suse.de>
> Previously-reviewed-by: Jean Delvare <jdelvare@suse.de>
> Previously-tested-by: Jean Delvare <jdelvare@suse.de>

I'm still happy with this patch, so you can change that back to:

Reviewed-by: Jean Delvare <jdelvare@suse.de>
Tested-by: Jean Delvare <jdelvare@suse.de>

Thanks,
--=20
Jean Delvare
SUSE L3 Support

