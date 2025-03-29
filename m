Return-Path: <linux-i2c+bounces-10066-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B83BA756AE
	for <lists+linux-i2c@lfdr.de>; Sat, 29 Mar 2025 15:32:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0359E16F274
	for <lists+linux-i2c@lfdr.de>; Sat, 29 Mar 2025 14:32:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FF5F1D61B7;
	Sat, 29 Mar 2025 14:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="o7oEpoNX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F67322E
	for <linux-i2c@vger.kernel.org>; Sat, 29 Mar 2025 14:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743258719; cv=none; b=t99cfEyUV+eS9m5Au4brckWjodDlO/NK6ckAXPicWX2bALOt0J39oZAt/9Hp3w+CIribyqGnw3fmiKMrrKBW1xsrEiuTTvf3mRzBcjUI8RwKtqyfx2zuIyjgJhfvuQUDweJsYJFyILWGNEJjv7iZPvfEKzxm1Nh0cx77IyBKBEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743258719; c=relaxed/simple;
	bh=wLtpyn/hMcKpl0Wq05B7lWHnz0EIhT5E49EY7+W0wB0=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fNZBiK/lafcbmco6si+8WJakItAVOi8UZ0M75UqgbHqq0+bh5dTcZMgqWAXOf4NcxC2qjy3yf1CnHXoidqkyMbJPFehb0Tkpj68CoIEA/00TqqB9yEYmjvcOJN1it1Rd8WwmV7cglXqejBKElBQNlFj2c5fSnu12AzyJvA0iqpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=o7oEpoNX; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4767e969b94so3221581cf.2
        for <linux-i2c@vger.kernel.org>; Sat, 29 Mar 2025 07:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1743258717; x=1743863517; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OaG7HxKSmuBYBF/CBkUMzKi71PYV79N9N9a2jU7hfLA=;
        b=o7oEpoNXByKmDwVls9gviJyoy47Zc03RZKEtNfq867Dqsgj9BFtbsgayt6U5VKe14u
         KUQoA60jMaZ1hnx9+TbaTwPtRy9ZSHNyaQkqTfK91ZY5Bq2MK0SoqFc3fQ7019cVwxC5
         Y1J9W1bVE99suWZFlEEqdh6v1gUq5a9EaoM1GDghnOcxdzkmEyCh4EYVcRk9os3pjvKo
         oPH3NlPtPRtBpfaPviMaubuILuT/iYFnPc1NhGWh+Rd3AQtH9eSCogKd2j6gKk21zr0i
         vtlAZEenHgUWEpKj78LQdimFGa+Aa4YWwMEIzVg8K9/60rKyzXNSZTaF1e6lMq6yyFkZ
         M/Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743258717; x=1743863517;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OaG7HxKSmuBYBF/CBkUMzKi71PYV79N9N9a2jU7hfLA=;
        b=D1uFyXeouIKvjyNEjj0vR4X4GbZOmORXS0yjx9YWXpiFGjpSVyqajKyt1Bz66AMOgi
         Q7jymo6dp42Qg8/u0bYBm91XDeDcX0Resd/NPAQVVXHMG6GacfXokhMtHY/giCauElpd
         oBmKZILTpizkJ29w56xkYeRFFaShQpwryQOqKUl7CEPbSkpoVxlx0mBNm/xYL2MeZQP6
         bMERWa/it1N0YfKUyBkAKnLllKzgYJM+eu0Gy6rvvGXwPWEv+wrbKNzsZNKXBQEKnZR+
         MvbiBKo07LmbxybtQHYVkh/QapSsYf2U+2pc8hZ0Ug++694J1Oc9X0Div5RUfmN6Ua3E
         1pEA==
X-Forwarded-Encrypted: i=1; AJvYcCWUzi+hKmygBuKlt07hvKSYfqBUKh9w+Vx70fXvunA5hzYuk7pO5THWo4oEihS5nsQIJ5H2HZyyO/8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnIa4NJ43oEugkPFFpum7wuUCxk+OpMPw4WCgiwjRzWJz/VCCB
	623gMnHhzfJf+XqkYxDIkDgPo+K/b5M0HxMIB+iUQcxx6b85n/CVxouJt6UHVA==
X-Gm-Gg: ASbGncsMANf6lZAld16NjnKmvtpsd6OuwQv8ncVpv/uYcW6O8IPtx1D44oC/n2RD/Rm
	Vp9aNnhV0rrgPRqIqB2tgOe60NfHMYVB34h5A1/+H1WiorQR4rC1MrCVk3mMmeUitlMyx15OMQy
	EXM0+9Sv/UQb4noeCdM+U/lGqVwhVZRJtWADQo4duaLsvbVc8oq380CxC0z+IOrsHpwSHI3jn5O
	sIQxWtSKgntVLDdGorzPLrOiQ8hvWBrq8S096WhjTxnq6dmkI7LoIcA78MCDSqJ52PwFE84X5bw
	sesUwhAm67sbu65F8V40ALqIar7N7xT/Jj5XBEPr0tNr4FplKfTXpu8=
X-Google-Smtp-Source: AGHT+IEV3SanNOlMZvC6jvdjgGVmfwiPj0zla8rOJEMOLQXnfMizozhnA/YNcGw053bRBznlRLE+4g==
X-Received: by 2002:ac8:57c5:0:b0:476:bb8e:a90e with SMTP id d75a77b69052e-477e4b71b1fmr42029621cf.20.1743258716858;
        Sat, 29 Mar 2025 07:31:56 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::df1])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-477831a37f7sm24048601cf.68.2025.03.29.07.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 07:31:56 -0700 (PDT)
Date: Sat, 29 Mar 2025 10:31:52 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	syzbot <syzbot+c38e5e60d0041a99dbf5@syzkaller.appspotmail.com>,
	gregkh@linuxfoundation.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH v2 resend] media: dvb: usb: Fix WARNING in
 dib0700_i2c_xfer/usb_submit_urb
Message-ID: <a2bbdfbf-d7aa-4601-ae1e-18d75d011084@rowland.harvard.edu>
References: <d0fd60d7-5660-42ed-b1c7-4dfd6b8e74b0@rowland.harvard.edu>
 <Z-MrfICsY06DZV-2@shikoro>
 <f8e975a0-87d2-4f83-b580-6858050a252d@rowland.harvard.edu>
 <Z-QjIRoOWpoWaL6l@shikoro>
 <c6bed13c-38df-43a6-ba5f-0da03b91f3df@rowland.harvard.edu>
 <Z-RyiI1X9BN43feQ@shikoro>
 <c7f67d3b-f1e6-4d68-99aa-e462fdcb315f@rowland.harvard.edu>
 <Z-bEBk68dh918vy9@shikoro>
 <24798648-c5a3-4e31-9897-4610053007f3@rowland.harvard.edu>
 <Z-eNvcrFu0VSY23U@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-eNvcrFu0VSY23U@shikoro>

On Sat, Mar 29, 2025 at 07:05:49AM +0100, Wolfram Sang wrote:
> 
> > In the case of dib0700, it was clear from the source code that the 
> > driver uses USB Control transfers to tell the hardware about I2C 
> > messages.  I don't know if other bridges work in the same way.  In 
> > theory a bridge could use USB Bulk transfers instead; they aren't 
> > subject to this restriction on length-0 reads.  Or a bridge could use a 
> > Control read transfer but include extra header material along with the 
> > actual data, so that a length-0 message wouldn't end up generating a 
> > length-0 read.
> 
> Fully understood, thanks for your explanation.
> 
> > So the short answer is that you would need to find someone who really 
> > understands what's going on here -- which I don't.  Sorry.
> 
> No worries. There are only 5 drivers or so, I will manually check if
> they use a control_read and have no own header. Doesn't sound hard.

Good...  Feel free to ask me if you have any questions or need any other 
help.

Alan Stern


