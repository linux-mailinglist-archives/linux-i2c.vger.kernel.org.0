Return-Path: <linux-i2c+bounces-2-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 165D77E7EB3
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Nov 2023 18:47:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 451601C2097C
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Nov 2023 17:47:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25CD739877;
	Fri, 10 Nov 2023 17:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="U7P/f08W";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yuE9CeiB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9200D38DE0
	for <linux-i2c@vger.kernel.org>; Fri, 10 Nov 2023 17:46:32 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BDB72B7A9
	for <linux-i2c@vger.kernel.org>; Fri, 10 Nov 2023 03:08:26 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8666A219A4;
	Fri, 10 Nov 2023 11:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1699614503; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+fB/CoD0K/hb8YoT5PRdBX4VZfuV5MZaL/xil7s4aGY=;
	b=U7P/f08WW7QWf/WP1n6wzntmqdFI9Oie8beiH9aHnAq/eTL9wBh7RYuq2Akn97NXwFBkOp
	S3Se+ZSybVlhah/gMp7cauIBrGFkI+pobxGeacZaI57A/uBIhmB5cMcaIQPYlAbBI8C5mA
	6oVNBLmcuMkI8drQgBb8GpODJQ3HDsU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1699614503;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+fB/CoD0K/hb8YoT5PRdBX4VZfuV5MZaL/xil7s4aGY=;
	b=yuE9CeiBouEECU5+qlVVihPR/m1qfITgz1Wbx8tkLwn12K1kmdYKLYIu5QjnSylvXwT7kF
	fpA/1vaGwo4aOTAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5558613398;
	Fri, 10 Nov 2023 11:08:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id zLs+EycPTmU1dgAAMHmgww
	(envelope-from <jdelvare@suse.de>); Fri, 10 Nov 2023 11:08:23 +0000
Date: Fri, 10 Nov 2023 12:08:22 +0100
From: Jean Delvare <jdelvare@suse.de>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org, Peter
 Korsgaard <peter.korsgaard@barco.com>, Peter Rosin <peda@axentia.se>
Subject: Re: [PATCH] i2c: i801: Use I2C_CLASS_HWMON for i2c mux children
Message-ID: <20231110120822.7a81421e@endymion.delvare>
In-Reply-To: <4fdf5873-b366-4601-a9cd-58814eed321d@gmail.com>
References: <45c5366f-cbee-4c7d-bb62-a446935b2729@gmail.com>
	<20231106155036.366fb752@endymion.delvare>
	<a22978a4-88e4-46f4-b71c-032b22321599@gmail.com>
	<20231109145212.01f7b597@endymion.delvare>
	<4fdf5873-b366-4601-a9cd-58814eed321d@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.34; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Heiner,

On Thu, 9 Nov 2023 17:34:15 +0100, Heiner Kallweit wrote:
> On 09.11.2023 14:52, Jean Delvare wrote:
> > For example, if DMI data says the system is using DDR4 and we were able
> > to detect and instantiate an ee1004 SPD device at I2C address 0x50 then
> > we should probe for a JC42.4-compliant temperature sensor device at I2C
> > address 0x18. An SPD EEPROM at 0x51 would correspond to a possible
> > JC42.4-compliant device at 0x19, and so on.
>
> Nice idea. How about our ASUS use case in i801? i2c_register_spd() isn't
> called in case of muxing, neither for the parent nor for the mux children.

When I introduced i2c_register_spd(), I wanted to go one step at a
time, as I didn't know what to expect due to the wide variety of
systems affected. For this reason, systems where the SMBus is
multiplexed were originally excluded. There's also a limitation in the
function itself, on the number of memory slots, which is 4 for now, but
could be lifted to 8 (maximum number of memory slots connected to a
single SMBus segment).

The Asus boards we are talking about may have more than 8 memory slots,
so they would fail the test. If we want to be able to use
i2c_register_spd() on these boards, some adjustments will be needed.
For example, we could add a parameter to bypass the memory slot
counting, so that the function could be called on children segments
(only a subset of the memory slots will be connected to that segment,
so the total slot count it irrelevant). We would ignore the DMI data
and hard-code dimm_count to 8 in that case, to probe all possible
addresses.

Another approach would be to add a parameter (probably a bit field)
describing which addresses should be probed, instead of guessing that
from the dimm_count collected from DMI data. For the Asus boards in
question, the information is known, and this would speed things up a
bit by not probing addresses which can't possibly correspond to a
memory module on a given board. That's only a minor optimization
though, so not necessarily worth it. OTOH having that possibility would
give more control on the probing, which may be useful for specific
boards.

-- 
Jean Delvare
SUSE L3 Support

