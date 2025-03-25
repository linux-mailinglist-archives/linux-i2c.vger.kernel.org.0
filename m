Return-Path: <linux-i2c+bounces-10014-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D17C3A7072F
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Mar 2025 17:43:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 338D41886F99
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Mar 2025 16:41:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C79525E812;
	Tue, 25 Mar 2025 16:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="EX82g2J4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B4B25E802
	for <linux-i2c@vger.kernel.org>; Tue, 25 Mar 2025 16:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742920885; cv=none; b=Ad2Vhi2dy/n75oyq91V+Hp6f56i3z3IQ6I8b5lZyOonjjXnxenoTQJTZqWAdXmsfQM4kcOGWDamKX7Mom3ah6r4hb9IttKOc3kq/TB+GnsMjkp1/GWajwQtG1yXx59z5M4wKljGVvAbkhs07ZMr4OIsQqaOlBUDF1vPJnuR7g0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742920885; c=relaxed/simple;
	bh=HE0WwEEjXe2OvIj8FLiwdnpX+f7YNiat07ISj1wGnCQ=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FRG63SPsqzE5FdKk9+O1L/Zgk+/Loz+f4UzqIXNtFOSCn8XVm2Mslpv2wEAWpjPVKJpWqdh+SObxRNcz89qRNqW57lFoQ/xYBw8zvF5CJP5kn50gSQgaFv3lfW91ibIC6pjh8UVGGpAlM40QkmsiBA9q+4M3RWia4ePSY+hOEvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=EX82g2J4; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6ecf0e07947so177796d6.0
        for <linux-i2c@vger.kernel.org>; Tue, 25 Mar 2025 09:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1742920882; x=1743525682; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=miqKoY+UYVscqlsw94wZLt2jeTP0mGsCrBdRIv58gSg=;
        b=EX82g2J4RfMYTVP0xtt//t6++4uw1IXPfjARXV/8V+HRSFf8vLvA0/0dXDpoPaDnDZ
         yj3Be3YD1behcXq17dp0qbJzcH8JiYY4lAc9GSzl2DAr2CcT/kIhGSkUEghmxsJp1ElP
         QkSyW7K71jWYFdJSz3tMHdoJe+wHqSi7QQ2ChgTU3xrn2DvYr0vKgCQSW2aKevQWEY+u
         PjyTTyZz9JSwBPV97nBq0IaKUKmQIYQjCFue+3Pt98jj/WlsY22p/ZzkS8HOp5FK9SkG
         lWc6jeTh1lgtQwESsxSo5D5DDm3Wwg6JzGvwcOgs8ox2FTjOjeRZZaeTWLhvl3lLmyFz
         OdrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742920882; x=1743525682;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=miqKoY+UYVscqlsw94wZLt2jeTP0mGsCrBdRIv58gSg=;
        b=qPw+VZnxaQwNSvL5f9/e1bnf4jBz8fIZTib8KlfSizEi9jBOvJE2wslvGlg9oWs394
         BiwMdtA/mA2K46u+ZtpPjUn+aZl6OsaeC7mKD7YTHNtgLow1Mp0Y4lUtAGiN8aSJfWtc
         pQBvJUWnAdbLp2GLvmM0Q1ZrUfViT3dG8MFVwzzZ/SHNc2LbzGEYNq5hFPygI4iaCxIb
         r28pNy8eBQlgAyQZKWO6vh5IeFD5TlqSkZ2VVVFm5qNVtTO1uM25GgEJgdaKFCdccRZQ
         TgXUu8dGik/Mjf9/5W7EkuRTs6pmZUQpmTNRl7SLAGLkBStbRuqnAaFO+Y9Rawb9yrYZ
         OvKg==
X-Forwarded-Encrypted: i=1; AJvYcCXRIa5tWevrAz/0qjRJulSFA+JyluiyzUdgsIXrnoQKldNmKqEA+6+vBaMpEcSHLbyqTUbYCEzWems=@vger.kernel.org
X-Gm-Message-State: AOJu0YznWc74DYkyx2hqH6wKOMf+TpWFlPD8EtwtFhLzmz6O2Vm9RGOx
	sMVKm1xe5PFrIbel/fLFXeGQWHZ7jkqH7H8tkWmlV20O6f9QFCPXBM+1lMAZkw==
X-Gm-Gg: ASbGnctqAEuSyiWJFsqZMWBcKgVT2VvdCChvE6+WRIamySBh3W8P0do495B2Ta+mtXA
	hihVz//+441ke0nmdfXTaeRBOp62+cm6t56v0dJdxsooNg9+GxPOSMhI81VMYAfttnt+JtB/KsJ
	3Nw6QOwi8zxhrg5j8LhrlRRBZzm1SsK+1XQ/0+xDad/HpS66lUF6tedZSz8nx814RZRLni2s2lx
	ZekdXlP9XVXNNIjNaVZ0r7PbFMCOMuKF8MEE6/2Z2gmcNC9J4N31wCZIeVbMFyO21+xOh782AAz
	ZaVhXZ+Xj/PtHbUqVN9TUwxDgfb7a3C75SsAenHNAjZ7ILQnsTWIl958/4LruvY7xmz6kzI0kFn
	XwH3AC2Ga35h1Wf6G+1OTXTBne2C2wKuQdRLCNA==
X-Google-Smtp-Source: AGHT+IFeP8N81JAGt1FKSNUu0N8sqMwAbRybniXeyxbpbDyGTB3nk4kytpnyLPPjCGdlVLhPquev0w==
X-Received: by 2002:a05:6214:3d9f:b0:6e6:5b8e:7604 with SMTP id 6a1803df08f44-6ed16cbbed1mr7940456d6.12.1742920882545;
        Tue, 25 Mar 2025 09:41:22 -0700 (PDT)
Received: from rowland.harvard.edu (nat-65-112-8-24.harvard-secure.wrls.harvard.edu. [65.112.8.24])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eb3ef0ed7dsm58440546d6.25.2025.03.25.09.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 09:41:22 -0700 (PDT)
Date: Tue, 25 Mar 2025 12:41:19 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	syzbot <syzbot+c38e5e60d0041a99dbf5@syzkaller.appspotmail.com>,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com,
	linux-i2c@vger.kernel.org
Subject: Re: [syzbot] [usb?] WARNING in dib0700_i2c_xfer/usb_submit_urb
Message-ID: <ecdc37c4-b178-4e43-bfbf-45bd3ed29ff2@rowland.harvard.edu>
References: <67e1a1f5.050a0220.a7ebc.0029.GAE@google.com>
 <acfa19a7-9d24-4cd6-9d1d-580a9ac7473c@rowland.harvard.edu>
 <Z-GwRNe8NIigXYtS@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-GwRNe8NIigXYtS@shikoro>

On Mon, Mar 24, 2025 at 08:19:32PM +0100, Wolfram Sang wrote:
> 
> > As far as I can tell from the source code, the dib0700 simply isn't able 
> > to handle 0-length reads.  Should the dib0700_ctrl_rd() routine be 
> > changed simply to return 0 in such cases?
> 
> The adapter (I assume the one in dvb-usb-i2c.c) should populate an
> i2c_adapter_quirks struct with I2C_AQ_NO_ZERO_LEN and then the core will
> bail out for you.

Or the I2C_AQ_NO_ZERO_LEN_READ flag bit.

What about all the other fields in the i2c_adapter_quirks structure?  
How should they be set?  (Note: I don't know anything about this driver 
or these devices; I'm just chasing down the syzbot bug report.)

Alan Stern


