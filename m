Return-Path: <linux-i2c+bounces-10021-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A9FA70C5B
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Mar 2025 22:48:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3D71170C40
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Mar 2025 21:48:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 711511DD0F6;
	Tue, 25 Mar 2025 21:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="CB0SIAnG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B361F09AF
	for <linux-i2c@vger.kernel.org>; Tue, 25 Mar 2025 21:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742939279; cv=none; b=r3oQVODgqtruCZ2NyO3e6K7vnPOseJM8SPtZcVW1wn+G9TdlQZgxLTuuf0U7JpHPK6b7mpLwWuy1YXzWJD3IDrSfCwoy8lSKCky1qYVgNL+FbGmhp+DA6Is52Q/gvZzcupCJkJJit9Qu9OGWi5Rz8SjbYrbBnhInV0FffqxW8L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742939279; c=relaxed/simple;
	bh=QETzk4pWUdd8GTK9mbSDrwkUGp7j6xwkhUzJ0GqSv0U=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WveBVGgfIETAaZGJtPe/fHXo31CsRQGdQcu+IytbVzqEyxLqI5pXHwWc4LPk3O498T+GTZSJX8TEHuRy80Nf4RqH2XB/Rcab0IC34Jl7nCf/y5/4BVCjtM1TJx3BJL+m4maDKfoF9NecK0vTQWy5Ox8+fC+MA6QeRVhQHrTIWs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=CB0SIAnG; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4772f48f516so2745261cf.1
        for <linux-i2c@vger.kernel.org>; Tue, 25 Mar 2025 14:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1742939276; x=1743544076; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wjSQcs1axKYj4DiilJ42WS/RY+75sj0DasrfbCjQhfE=;
        b=CB0SIAnGmxdFUz4yVjdZHL1LYJzN2aYSQV6WscOvYM8w/zZNQHzEHtLYnQZ+whTzRO
         fcWn0s6V6/9XgM/S0/4N8gASvUrV2kO4UMjvQ7+vFA4iLuuuFB/xhgfidjRyKJ9oR6Gg
         u544FtWhQyo8DyReq68Z7cUoGee6qcGzpXis/aUeRKlDUqgppXr+SixZDl6iPghqrTu4
         JiIMJ3B0S2kwUb5wuR4OPlh6Tv6VEgeLdJjrge3WSOmAWrRArtuJjbGDneS2YbXz5f7x
         h/EEFLsUYc1azLWYlDnLW75GPKM2TsAPCxkMF6JZQwIa0n5ayLCLvxP3yPK4BG61y+JJ
         6jeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742939276; x=1743544076;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wjSQcs1axKYj4DiilJ42WS/RY+75sj0DasrfbCjQhfE=;
        b=sv86MV99t2trfXsR5oYeA5Js93dKLIls+hx0mvIchNVEsPAytxxdeyfccRLKrtTNkq
         IIsFaCH/vHXNE1/by0msIJh42Cu+3XTz5N//McHOcxJNyAvcGszLH6zgvh7hZnHjBUgl
         juBJlSN1c0+7IzpbhnJa5xChySy7c4Mgy0lresIPQnY28d3BM7TfHTpnDZRP1+jgPpO7
         x46Ra9JUuLLyq3cS/+Ecc4Xb+peTxU6+GZWyoKBz6CjSOoRpmJcnjVia/iCJRrelfet6
         iZEcfYFwaSFfMPONn4vy3/TgEqEAHlzi0ReD7rAq4KiLfNsyYV8e4xFti17jrrRqWdPV
         6dRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlzkwnlMql+PhUMA0I3MXm14kRYB3iZIGL6nwhLbK5oc5PB9vwyWDX8yXPNjyHUcHY5PJnaYrCac8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXMyBi34MIEXsNS6GSugRvOZ2XO3wjX/aORzxoQLKPB6FXtw2G
	IOnvMRs6SPzHHTAJspSrljStf4MYceoBTQbYkDAh12LsOYEsilBtIgW6LCHYj0l/BJg+f6SAlS4
	=
X-Gm-Gg: ASbGncu2itmlgGShZFMRfdjfCOKOwbT3bqfihZyKyQFGwstVctLS09JJWvjwEN1rMtg
	cXjiWeGz5/teAa4G3OuDBxsRmmYGwg3lS0RMYN1LgkhrWspKDALyvUPFa/Z8u3TmwP8k6MrffzH
	PGyKykXlI4po6/PDbO1hmw8kWMsLm47t3jr4vqpa1AsYzYaLpie+JkDF5EF5KkpPwEdVPEsGe+K
	uqaQgqAXZfveBx6czMGbv4qEUPQBpZJJZnWSi+/4D1XVEeB92GQhvDbEBRbWiTZmKKPfz4xlXpO
	RXNtHaTSWBi4eIxum+GXCG0CFS5C4fBV7mNA+PaxqeqRzw==
X-Google-Smtp-Source: AGHT+IGa7jO/ejiTjbS4D+JRAtx11lg1Iif+dd+JHkXnhyYOFTmofUITjiHEUTYyKHeLyVKHjj7o9Q==
X-Received: by 2002:a05:622a:2b49:b0:471:9e02:365e with SMTP id d75a77b69052e-4775f2f8693mr21094701cf.8.1742939276575;
        Tue, 25 Mar 2025 14:47:56 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::3b5d])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4771d18fe25sm65734241cf.42.2025.03.25.14.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 14:47:56 -0700 (PDT)
Date: Tue, 25 Mar 2025 17:47:53 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	syzbot <syzbot+c38e5e60d0041a99dbf5@syzkaller.appspotmail.com>,
	gregkh@linuxfoundation.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] media: dvb: usb: Fix WARNING in
 dib0700_i2c_xfer/usb_submit_urb
Message-ID: <d0fd60d7-5660-42ed-b1c7-4dfd6b8e74b0@rowland.harvard.edu>
References: <6bb3b80b-a808-4992-8666-535ed9a5c980@rowland.harvard.edu>
 <67e2fed5.050a0220.a7ebc.0053.GAE@google.com>
 <29db5fdc-13c9-45f0-9183-c80d637725c6@rowland.harvard.edu>
 <Z-MKiV0Ei5lmWik6@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-MKiV0Ei5lmWik6@shikoro>

On Tue, Mar 25, 2025 at 08:56:57PM +0100, Wolfram Sang wrote:
> 
> > +	static const struct i2c_adapter_quirks i2c_usb_quirks = {
> > +		.flags = I2C_AQ_NO_ZERO_LEN_READ,
> > +	};
> 
> Why didn't you create the static struct outside of probe?

Because it's used only in that one function.  But if you prefer, I will 
move the definition outside of the function.  It doesn't make any real 
difference.

Alan Stern


