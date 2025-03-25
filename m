Return-Path: <linux-i2c+bounces-10017-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF45A7086B
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Mar 2025 18:47:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6DA73B78F9
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Mar 2025 17:47:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85D98263F2C;
	Tue, 25 Mar 2025 17:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="RiFmS2yP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99700263F28
	for <linux-i2c@vger.kernel.org>; Tue, 25 Mar 2025 17:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742924841; cv=none; b=XRC0f8FlANFD0nh9U89XOKyqsJ88do3C/4CrcVMlfvJFSG3j2VTeppSzRe4rBtFcJD0d4PIOEMlkz8GNeg5RPlaVi6nFlu67bA0RHVhdDFGfTaD3Q4iQ1gTswbLDmtbWHK397dJJGTqRtDKTHckAGKBlgUQOpYvQreiASrdEyGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742924841; c=relaxed/simple;
	bh=goKPkMeXynwdrhBXnRq9X1VvT6tW+FJCFrUGgCdOnmg=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tWW0NWxBW2kkqtXNpws8dHmDPPCm4I68bdG45dXLxzV+2c+iWhLYX4rfJqkgTI0nRJ9a5ztQAjPuPhQYjxifPKypQkp1HD/rPC9YpFOPntSu7I4cvbpH0jBOTwGQK6Ea5TONVYQqA7z6injS9YfXqDsGJfgLglMiuZLibuu06gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=RiFmS2yP; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6e8fc176825so48513256d6.0
        for <linux-i2c@vger.kernel.org>; Tue, 25 Mar 2025 10:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1742924838; x=1743529638; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KjH1g6ftKk1WIu6TE8/3Mya2cmPNBafybymHxTD9mE4=;
        b=RiFmS2yPwpzXwLruNurFXEeXSL2ike4PAgZjfJvw3f2bMQp7D+X5aQdEi+/iHOD6xb
         QEXChE3bWBBE0BQXE+G0KwrGRxKb+BUFPVrblKcVnlgY+9t1Co34dsS6M6KReUaHicen
         J8Y6tilYG818HT0ShqpexiSCxaeXC9GH3VZtUJvbMgZZICUHDAvgad0c+xTuBDgCqmVz
         XcmPVcz0YqWGZLHenjXXW9syLh61SwAlL33m/RsgyYXm10vCl98ALzk3rEgQmq8eB+UF
         yxvMWP2D7JV1Ab70eClf6abpx16+bPDt4nVOTV6LbuWKXIBBQNzcn52uQOUzNPEKIiPb
         hjHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742924838; x=1743529638;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KjH1g6ftKk1WIu6TE8/3Mya2cmPNBafybymHxTD9mE4=;
        b=KB8LGBreCl5QYzIrqJ82vg6qP38pX1yvXUH3nQv5zPekBEBVx7BhUyMxwBS0StKguZ
         xLMSCC1PTm9z+Gc6L3YWNs9rv+Kf/MJrj2X4HDHeC6CKFywLFVUQTU+RF4wffZe3Cs4U
         79OfQTPtbGtcpBiOHbI1tha2KXRaTd2Mf18RcUIhv880QCbIbhdM+cbN3lYRnzshE84L
         dg1zkrMLg4GyfUmOMZggql+xP7YX9+vxULRgdBGSizKGlOgCJP+GMQpqq+DjH3xHtilk
         zVUdvZEXRaCd7WLM/LHonbCCQlRPFl+uOjZ2Kf5ViO4FdMhhZPbTb0g7l62ACXHoVzZK
         fmUg==
X-Forwarded-Encrypted: i=1; AJvYcCWxWyFT+ZXfHyIuwnZjkyK3h3JESMTdjLHF1u+pQI4eAKaggz1wPE7ljbTaipbXUMDoKsXwnvDcJno=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXXheHwToKCJpm7oEVHltkSB7K85EGocTNCAPJUGnxpTjw/ltY
	63bW/h3NFz80++epwQGPT74TW/QGSQHTJsdiddlcRrVInOc6bp7qakgiLOv1Cw==
X-Gm-Gg: ASbGncsYgYpSUiv+1CSgIBQpMZKF9b2pKnmjnW3gWwBQ1icA2YM0p6hy7Q15c+dYEyk
	kM9oJKBOfq925Uh7dhevvwGeLUUZ2eiwaH1sdbw41DgcnLNyXCT3V0YGZD5W6b+w/cbh4xoesGc
	coE79Un42UvPtmDSKzznpAumD20iZICahXc8g0KDlu/9bRae7U/BgGNVD9vBzNBs/UbybqXHnvp
	i3ZzO0oqo1/9HirpFMGR1EEI67dAppOpm45wM1P4wkv3mXTKvEHCcApfc4twBiVGQGM2rXb+jJt
	ONQXQwPerVGEEa8ASIpf/b3YCgRye6FgK4K4DTB5x5d+2gNNq8XbTht/dQRkXcozRLgVQtZWFhf
	1uLjdahKFoywmeaU0No7m1y/sIOg8YekHHtOuvQ==
X-Google-Smtp-Source: AGHT+IEE3s2WyDicsHyN8I8hDTQsl58ko3gMhcMuYw+oTIF/jYZenScg9DM9xoAREespRcfMxIvUaA==
X-Received: by 2002:a05:6214:19ef:b0:6e8:97f6:3229 with SMTP id 6a1803df08f44-6eb3f294676mr269179956d6.16.1742924838295;
        Tue, 25 Mar 2025 10:47:18 -0700 (PDT)
Received: from rowland.harvard.edu (nat-65-112-8-24.harvard-secure.wrls.harvard.edu. [65.112.8.24])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eb3efc5a1dsm58469186d6.79.2025.03.25.10.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 10:47:17 -0700 (PDT)
Date: Tue, 25 Mar 2025 13:47:15 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	syzbot <syzbot+c38e5e60d0041a99dbf5@syzkaller.appspotmail.com>,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com,
	linux-i2c@vger.kernel.org
Subject: Re: [syzbot] [usb?] WARNING in dib0700_i2c_xfer/usb_submit_urb
Message-ID: <6bb3b80b-a808-4992-8666-535ed9a5c980@rowland.harvard.edu>
References: <67e1a1f5.050a0220.a7ebc.0029.GAE@google.com>
 <acfa19a7-9d24-4cd6-9d1d-580a9ac7473c@rowland.harvard.edu>
 <Z-GwRNe8NIigXYtS@shikoro>
 <ecdc37c4-b178-4e43-bfbf-45bd3ed29ff2@rowland.harvard.edu>
 <Z-Lg3glmnzA44R_H@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-Lg3glmnzA44R_H@shikoro>

On Tue, Mar 25, 2025 at 05:59:10PM +0100, Wolfram Sang wrote:
> 
> > > > As far as I can tell from the source code, the dib0700 simply isn't able 
> > > > to handle 0-length reads.  Should the dib0700_ctrl_rd() routine be 
> > > > changed simply to return 0 in such cases?
> > > 
> > > The adapter (I assume the one in dvb-usb-i2c.c) should populate an
> > > i2c_adapter_quirks struct with I2C_AQ_NO_ZERO_LEN and then the core will
> > > bail out for you.
> > 
> > Or the I2C_AQ_NO_ZERO_LEN_READ flag bit.
> 
> Yes, that would be more convervative. Does USB allow zero-length writes?

It does.

> > What about all the other fields in the i2c_adapter_quirks structure?  
> > How should they be set?  (Note: I don't know anything about this driver 
> > or these devices; I'm just chasing down the syzbot bug report.)
> 
> As I also don't know the hardware, I suggest to leave them empty. 0
> means "no quirk".

Okay, let's see if this works.

Alan Stern


#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 5fc319360819

Index: usb-devel/drivers/media/usb/dvb-usb/dvb-usb-i2c.c
===================================================================
--- usb-devel.orig/drivers/media/usb/dvb-usb/dvb-usb-i2c.c
+++ usb-devel/drivers/media/usb/dvb-usb/dvb-usb-i2c.c
@@ -10,6 +10,9 @@
 
 int dvb_usb_i2c_init(struct dvb_usb_device *d)
 {
+	static const struct i2c_adapter_quirks i2c_usb_quirks = {
+		.flags = I2C_AQ_NO_ZERO_LEN_READ,
+	};
 	int ret = 0;
 
 	if (!(d->props.caps & DVB_USB_IS_AN_I2C_ADAPTER))
@@ -24,6 +27,7 @@ int dvb_usb_i2c_init(struct dvb_usb_devi
 	strscpy(d->i2c_adap.name, d->desc->name, sizeof(d->i2c_adap.name));
 	d->i2c_adap.algo      = d->props.i2c_algo;
 	d->i2c_adap.algo_data = NULL;
+	d->i2c_adap.quirks    = &i2c_usb_quirks;
 	d->i2c_adap.dev.parent = &d->udev->dev;
 
 	i2c_set_adapdata(&d->i2c_adap, d);

