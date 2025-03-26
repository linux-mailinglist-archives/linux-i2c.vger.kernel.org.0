Return-Path: <linux-i2c+bounces-10037-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15AABA71B88
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Mar 2025 17:09:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 86A9D17A6BB
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Mar 2025 16:04:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45C8C1F5820;
	Wed, 26 Mar 2025 16:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="dJAs+wsn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943901F5619
	for <linux-i2c@vger.kernel.org>; Wed, 26 Mar 2025 16:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743005077; cv=none; b=I6HuvLIylTxl/C3sMN1ehiKtjBGE9I+7p/PkUQu7iW72pctjJKTwituHy/3sK8+UDXgqgjiFvW9MlwyOHskMchZcCCA68+4CV10i+XxVlwcqzkAMGPa8J0R1NiKgmfZwvbFsA+plHkoD6TH9fUixvmEPjdB/UIdVpEVdBAEx/mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743005077; c=relaxed/simple;
	bh=94f84rBX5VepA7AG0Ddzm8rexeXxs6TY5Rtfnx9sF1A=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W6WdQ1N7cY7tPxSn8fs9dJEEQViu5J876d7aeRE4PS29xuFGELswzpA/+WIukddNE/q/R8msis86WfKnHZ4Y4uRv/PCcroMHvN8P5NdCleDm12SZlb0+ob2Owg/bcwWmgbUHwc2RG74c1GKv2CUxsQ+HARJxL6sTwCqx209htYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=dJAs+wsn; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7c081915cf3so6313585a.1
        for <linux-i2c@vger.kernel.org>; Wed, 26 Mar 2025 09:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1743005073; x=1743609873; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Uga52cKqGQ1FOAloi1q6opFP1j0Ko6rKhd7jiox2rbM=;
        b=dJAs+wsnkL+dWHxRoZ5VRljwyWTgtRYSSZiOJF7FOVQxOa5xltMzvJ70K/H/wyXQz+
         nnITPJsUz0GgcPoUmCuGH/XOkUxEReuEAVkmbDXoJpdr7aTmJeEPsKBitqPwAUrtHZRP
         S76klybaQ+3jKeRlZtGBTisj43up+aaT1HdvQerITf1wmQUKVcWfqYxPumalvMI2NPl+
         /A+tRJi2b8f3RGqKHx1axbLqyoOSEJkH8GqUTvTPVYokKAdp9/O5YtgY2zALvBMfkAXb
         O3znMN9nkxtjZwTR+3i+8eb+u9qRbYbXKAM3Bm3JpTHR0cDV9A/CISD5BQZGNl7JtL1Q
         Nkfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743005073; x=1743609873;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uga52cKqGQ1FOAloi1q6opFP1j0Ko6rKhd7jiox2rbM=;
        b=Ib8rqNeAYkkQoprXc3CfLX1iyfm5gkBiNS5T0KiOf8ZTTpQW98nRKKpjYn84cn+lj3
         Is5oVcJDtj6rkConB43QSzYiQ3vlgf+pJSMNaReIwF0/GfiH5zyJ99vWjOPXzD6JPsHb
         yxwmqZUsh4IiSkFJydLksJfPEY4IO7G4hrJyTGzuhKxFkKCgB3E7V+QrgrHRnssnBEux
         kfCBUgTVSgPQIwP+wVg9Z33y2l+gChXqd9O1/hrmuel3NmtkxRb1Bz7BFEhhV44NGD2x
         gGD74kvA1qeCwZhUWOtON9ZmKTYaaun1z0hIBRgZrVT/ZogvkJ0mtlMUETDZIMcPFO1m
         2oAw==
X-Forwarded-Encrypted: i=1; AJvYcCUV+Z6+qKsqfLiEf3eFMYk3uhfB7OUf0o86yfB2XnvgH3o4Gx6zWfE1S4MNg9zryL1U2e0MfeYC5OY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxsj4h8CMaeJNyy3KBgsfbrPDSkuF9ioeFj6DJlO8Piv9kgtqa4
	VN7PJ3zEc6YZqB6rN6TSfNmFXH+1AD05YUBhtD4PujpHLxarlSxG9LUvZDCXrQ==
X-Gm-Gg: ASbGnctyi8vQfEiKPDCxkZ+O2Xh5shiAoI0RqWG/WcGJfenOxN6Y1lg47RB8AqMzOy9
	QvtOvqnsvH1dJQPbznez04weT48dgJtaIQEkZImD+BN67WGDibUG35zxp/TDE195t4hEZdRC6jp
	01bEISlfLiT6/iLrludvs99ai0i4cOR7ZPdHhDAR5L2p5j1JJYW7RPIRkBot/aCb/aP2cemciYk
	ZQD26geGkluE/gXWOKeRsS+kfD4tX7q+UW5PNeNZg5rJ5Ru7fZjh5xjvmhRTziN+Js2e9xkp4W7
	j3Ef++Sw3MVYRZN4YUeV12018bKWz/UEhzkOCcGiZN25F0K9KqcdnEhuabXJq+aL2WSjJuL/mWe
	1a++XCNi8jtm/2jYJOhBSQG+e3Dv/1DAvdrcGig==
X-Google-Smtp-Source: AGHT+IH6S8pOUbtu+BAVHi+tbBZs7cgoKKbH+qYcUJYmh7OUf+tNAgAPBhsZvrump26j2fb9I7dABw==
X-Received: by 2002:a05:620a:1924:b0:7c5:a2f8:e6e4 with SMTP id af79cd13be357-7c5eda0f1ccmr27993885a.29.1743005073268;
        Wed, 26 Mar 2025 09:04:33 -0700 (PDT)
Received: from rowland.harvard.edu (nat-65-112-8-24.harvard-secure.wrls.harvard.edu. [65.112.8.24])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c5b92d0137sm777709085a.31.2025.03.26.09.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 09:04:32 -0700 (PDT)
Date: Wed, 26 Mar 2025 12:04:30 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	syzbot <syzbot+c38e5e60d0041a99dbf5@syzkaller.appspotmail.com>,
	gregkh@linuxfoundation.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH v2] media: dvb: usb: Fix WARNING in
 dib0700_i2c_xfer/usb_submit_urb
Message-ID: <c6bed13c-38df-43a6-ba5f-0da03b91f3df@rowland.harvard.edu>
References: <6bb3b80b-a808-4992-8666-535ed9a5c980@rowland.harvard.edu>
 <67e2fed5.050a0220.a7ebc.0053.GAE@google.com>
 <29db5fdc-13c9-45f0-9183-c80d637725c6@rowland.harvard.edu>
 <Z-MKiV0Ei5lmWik6@shikoro>
 <d0fd60d7-5660-42ed-b1c7-4dfd6b8e74b0@rowland.harvard.edu>
 <Z-MrfICsY06DZV-2@shikoro>
 <f8e975a0-87d2-4f83-b580-6858050a252d@rowland.harvard.edu>
 <Z-QjIRoOWpoWaL6l@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-QjIRoOWpoWaL6l@shikoro>

On Wed, Mar 26, 2025 at 04:54:09PM +0100, Wolfram Sang wrote:
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> 
> Thanks for taking care of it!

Which maintainer should this go through?  Mauro Chebab?

Alan Stern


