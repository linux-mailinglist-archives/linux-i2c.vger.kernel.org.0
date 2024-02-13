Return-Path: <linux-i2c+bounces-1701-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A4A8532A7
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Feb 2024 15:07:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 201D91F275FD
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Feb 2024 14:07:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A48B15733D;
	Tue, 13 Feb 2024 14:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="v/WrsYGC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4/ciduut";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="v/WrsYGC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4/ciduut"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C154557310;
	Tue, 13 Feb 2024 14:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707833238; cv=none; b=qz+hchJhtFI3vgcf89elYzBeHC90XB0M4ggZY+8bH+obtKg+Bgfmp4kOnYjQ2gT5Ue2DcwDr8luNWneFsTS7ytYYgV2OLd9rLSSPQUgwRGASe72q4HFviFdXcgiaONd2EJQk75N5YIL9jyK/hzHBT/7ZDNQRU30RotA4LF2wwjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707833238; c=relaxed/simple;
	bh=bzMsl5t9UG1mFnEdAfVnzq+SbyckqnLeHHNh04s6WDs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ibIt5xcMEu9XC3bXQaLooqOMJLnBw0me3DyCpMyYQ041fWiLUQRn6MEc0l1NES3dgEJqivJ46YkzyHjWMVpuga/SIfI4TH5hdy75BTFLYrTSO3x4Fz1BWt1Vt5OQglvx0APIcsARPZGtdDHhqCak4tttMnzeH5vwukZ0TIPLS34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=v/WrsYGC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4/ciduut; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=v/WrsYGC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4/ciduut; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B6EE321CCA;
	Tue, 13 Feb 2024 14:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707833234; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bzMsl5t9UG1mFnEdAfVnzq+SbyckqnLeHHNh04s6WDs=;
	b=v/WrsYGCpBoL/21he4zED8l0wcZRhQCVSRmnnH2oPDs7N5bK6XRbPODnqFNTa1+cuS/mCB
	QsqaqUU2CzJ8IBNtCvt7Y3CjNe+uXicnUjx67+6g1zy+JmiMx5I27UBsLwh+I4wTyG6LNs
	DzvreBhxpzlRuQBk4OYbQfIZc7WXZOw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707833234;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bzMsl5t9UG1mFnEdAfVnzq+SbyckqnLeHHNh04s6WDs=;
	b=4/ciduutL+vpr4RUnprhXq9RyiLf3AO1qwQhYT/Z8RbVSaH3N4foKWSU0pgeqtc7/1veJL
	9b7UTOvU1V0s9sCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707833234; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bzMsl5t9UG1mFnEdAfVnzq+SbyckqnLeHHNh04s6WDs=;
	b=v/WrsYGCpBoL/21he4zED8l0wcZRhQCVSRmnnH2oPDs7N5bK6XRbPODnqFNTa1+cuS/mCB
	QsqaqUU2CzJ8IBNtCvt7Y3CjNe+uXicnUjx67+6g1zy+JmiMx5I27UBsLwh+I4wTyG6LNs
	DzvreBhxpzlRuQBk4OYbQfIZc7WXZOw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707833234;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bzMsl5t9UG1mFnEdAfVnzq+SbyckqnLeHHNh04s6WDs=;
	b=4/ciduutL+vpr4RUnprhXq9RyiLf3AO1qwQhYT/Z8RbVSaH3N4foKWSU0pgeqtc7/1veJL
	9b7UTOvU1V0s9sCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1B3F91370C;
	Tue, 13 Feb 2024 14:07:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0uNyO5B3y2X2IwAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Tue, 13 Feb 2024 14:07:12 +0000
Date: Tue, 13 Feb 2024 15:07:08 +0100
From: Jean Delvare <jdelvare@suse.de>
To: Pali =?UTF-8?B?Um9ow6Fy?= <pali@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>, Paul Menzel
 <pmenzel@molgen.mpg.de>, Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang
 <wsa@kernel.org>, linux-i2c@vger.kernel.org, LKML
 <linux-kernel@vger.kernel.org>, Kai-Heng Feng
 <kai.heng.feng@canonical.com>, Marius Hoch <mail@mariushoch.de>, Mario
 Limonciello <mario.limonciello@amd.com>, Dell.Client.Kernel@dell.com, Greg
 KH <gregkh@linuxfoundation.org>
Subject: Re: Ideas for a generic solution to support accelerometer lis3lv02d
 in Dell laptops/notebooks?
Message-ID: <20240213150708.57148f6a@endymion.delvare>
In-Reply-To: <20231223125350.xqggx3nyzyjjmnut@pali>
References: <4820e280-9ca4-4d97-9d21-059626161bfc@molgen.mpg.de>
	<a1128471-bbff-4124-a7e5-44de4b1730b7@redhat.com>
	<20231223125350.xqggx3nyzyjjmnut@pali>
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
	none
X-Spam-Level: 
X-Spam-Score: -0.37
X-Spamd-Result: default: False [-0.37 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 TO_DN_SOME(0.00)[];
	 HAS_ORG_HEADER(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 SUBJECT_ENDS_QUESTION(1.00)[];
	 BAYES_HAM(-0.07)[62.27%];
	 ARC_NA(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 RCPT_COUNT_TWELVE(0.00)[12];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO

On Sat, 23 Dec 2023 13:53:50 +0100, Pali Roh=C3=A1r wrote:
> smbus is not really bus which provides discovering and identifying
> devices on the bus.

For completeness, SMBus version 2.0 actually added support for device
discovery and even dynamic slave address allocation. This is explained
in chapter 5, section 5.6 (SMBus Address resolution protocol).

Unfortunately, this is an optional feature which requires active
cooperation from each device connected to the bus. If any device on the
bus supports SMBus ARP then you should get an answer when probing
(7-bit) I2C address 0x61.

Long ago I had a plan to add support for SMBus ARP to the kernel, but
gave up because I couldn't find any system implementing it. If the
accelerometer device in Dell laptops supported ARP then we could use it
to figure out the device's address, unfortunately this doesn't seem to
be the case.

--=20
Jean Delvare
SUSE L3 Support

