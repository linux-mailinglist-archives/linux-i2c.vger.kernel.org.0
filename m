Return-Path: <linux-i2c+bounces-3582-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D5E8C91F8
	for <lists+linux-i2c@lfdr.de>; Sat, 18 May 2024 20:46:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E3561F2205F
	for <lists+linux-i2c@lfdr.de>; Sat, 18 May 2024 18:46:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 380AA54F95;
	Sat, 18 May 2024 18:46:26 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD244501C;
	Sat, 18 May 2024 18:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716057986; cv=none; b=q6fVYvjEmiHiAZ2P4/qtu4HWJ0A/Ld86fTj6EZK7v8n9w38JHeNoOGhRPLqCcghZTQrDViAb6K/pjhUnvMabJ/yu5m+QIeRbjVy2BTBrcktR7+8oMvHcvzTmvUzjVivizAck3bavvZfR6Zb8shkXnbQyCT3iXFkW4Hh+58iHRFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716057986; c=relaxed/simple;
	bh=0a34K2H4C4Vm0M1n57HCMou9farWng/dA6As0pDr+Zk=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 MIME-Version:Content-Type; b=GPj1QqaJI49RXPUyXcna1STREQyGwQOlsh8L2b6VGVra1lGhaJHbEPzJVSwbwUDYm+Z1jW0HiCAKlU4AwbBUzOACfOAZ2B3Me9dzDDa3UVYMKy+IK7Rcq+aQc6prHWZ6kaPOzepRau953vnSrzpRhA5DICSgzlnEkZeWjnKfnZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com; spf=pass smtp.mailfrom=korsgaard.com; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 56BBA1C0003;
	Sat, 18 May 2024 18:46:13 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
	(envelope-from <peter@korsgaard.com>)
	id 1s8P4O-00Asw1-1z;
	Sat, 18 May 2024 20:46:12 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Grygorii Tertychnyi <grembeter@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>,  Thomas Gleixner <tglx@linutronix.de>,
  linux-i2c@vger.kernel.org,  linux-kernel@vger.kernel.org,
  bsp-development.geo@leica-geosystems.com,  Grygorii Tertychnyi
 <grygorii.tertychnyi@leica-geosystems.com>
Subject: Re: [PATCH] i2c: ocores: set IACK bit after core is enabled
References: <20240517191000.11390-1-grygorii.tertychnyi@leica-geosystems.com>
Date: Sat, 18 May 2024 20:46:12 +0200
In-Reply-To: <20240517191000.11390-1-grygorii.tertychnyi@leica-geosystems.com>
	(Grygorii Tertychnyi's message of "Fri, 17 May 2024 21:10:00 +0200")
Message-ID: <87wmnrnekr.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-GND-Sasl: peter@korsgaard.com

>>>>> "Grygorii" == Grygorii Tertychnyi <grembeter@gmail.com> writes:

 > Setting IACK bit when core is disabled does not clear the "Interrupt Flag"
 > bit in the status register, and the interrupt remains pending.

 > Sometimes it causes failure for the very first message transfer, that is
 > usually a device probe.

 > Hence, set IACK bit after core is enabled to clear pending interrupt.

 > Signed-off-by: Grygorii Tertychnyi <grygorii.tertychnyi@leica-geosystems.com>

I no longer have access to a device with i2c-ocores, but it sounds
sensible so:

Acked-by: Peter Korsgaard <peter@korsgaard.com>


> ---
 >  drivers/i2c/busses/i2c-ocores.c | 2 +-
 >  1 file changed, 1 insertion(+), 1 deletion(-)

 > diff --git a/drivers/i2c/busses/i2c-ocores.c b/drivers/i2c/busses/i2c-ocores.c
 > index a0af027db04c..a52f8fd4e2fe 100644
 > --- a/drivers/i2c/busses/i2c-ocores.c
 > +++ b/drivers/i2c/busses/i2c-ocores.c
 > @@ -439,8 +439,8 @@ static int ocores_init(struct device *dev, struct ocores_i2c *i2c)
 >  	oc_setreg(i2c, OCI2C_PREHIGH, prescale >> 8);

 >  	/* Init the device */
 > -	oc_setreg(i2c, OCI2C_CMD, OCI2C_CMD_IACK);
 >  	oc_setreg(i2c, OCI2C_CONTROL, ctrl | OCI2C_CTRL_EN);
 > +	oc_setreg(i2c, OCI2C_CMD, OCI2C_CMD_IACK);

 >  	return 0;
 >  }
 > --
 > 2.43.0

-- 
Bye, Peter Korsgaard

