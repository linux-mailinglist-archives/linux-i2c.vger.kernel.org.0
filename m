Return-Path: <linux-i2c+bounces-10063-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E2BA75402
	for <lists+linux-i2c@lfdr.de>; Sat, 29 Mar 2025 03:09:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D2D4616CADB
	for <lists+linux-i2c@lfdr.de>; Sat, 29 Mar 2025 02:08:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEDAE26AEC;
	Sat, 29 Mar 2025 02:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Zd4sLRTm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00BEB13EFF3
	for <linux-i2c@vger.kernel.org>; Sat, 29 Mar 2025 02:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743214134; cv=none; b=iRCwc+zbjlNp+hFpBDDLzB8qoUpx1aleImkMczxs9CkpO9B8Axgdt25cLHBfkrNNPxP9FcostoBgUe1K0BEeVB/4o+I8VELaQvZ9dPX4lHnE5ARIfqEVxtRUkmpSIT2s5eDJRK9RelzCqI7j6h2Sdrla31BIrWLU8kcXtJoFXDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743214134; c=relaxed/simple;
	bh=0+HnC31GvY6wN6NHBG+s6TLkjag8zoKgbsytjbA+8VU=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=owqKYqZHrP9JnK8VYEqabwoz/acILjfW/bbFcghzG+4tWWtwYVR1cK54aQnKqjJgbQ9NmvOu6n8v+TwMhr/+xpBDTM6gGF6Cwm98xLgb4DFffZM6TRoX5Bpz4Zl4uzrqg3lUMKq6oVbHXy3TzDdTENOFTkeGmYjrLb+IRzIzDKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Zd4sLRTm; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4772f48f516so38713221cf.1
        for <linux-i2c@vger.kernel.org>; Fri, 28 Mar 2025 19:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1743214132; x=1743818932; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oATviJxkq8eZnZ3wSWsDdw1hCY/CMybDZVnVXiFSWoo=;
        b=Zd4sLRTmUW6HQC6GFAmBRH7MrnLNxi7cH1RByvhTQoIMslcxQmqTDBd7DeywkA5ezb
         WQC+GSQckqVLU8eBttjDq7GiRynTpREusrUvHKUCZaHQuLjPokE+SPQeT1FG10bxYj9i
         OUHD2oL0TZ2PvVnYILE/YyikOt8TnIJXxunUgkOHdsC7udMptcKy9r4PjG8U3/LvFDSs
         /ih/SUnlMF62GnY/OhKQPL8/Rm/0uqmbWRxQ18qA5D79WB1R5Bu5vCnzEUEPt2iZ4O7q
         9ztK4q4jqXZV8GFZI+5/0acfwu+jy+rwVJAdZb3VocwJpBcd2Pp6fMNjIhvIq53dZaLs
         82Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743214132; x=1743818932;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oATviJxkq8eZnZ3wSWsDdw1hCY/CMybDZVnVXiFSWoo=;
        b=KwhFNwJ0IG6L8UYmCS41YHPeCxL6vRRCp2FNxSEKfPbuGUR31MRAnhAhibAq2q/q+l
         zXDeHfrid+yo7ab82fI2L5AKH/fo6Ol7bneX+4c3eVqmgGpvkTAZ5JQdvT5RSrvxp3l6
         wLn9cF0eF2uMN7JNvn7p7Dgd36PKx1PokMAcGUwpvQsoxc/bFNBud4pEh1iAgmuyL8Tr
         W2tmckV4RdYz7Y6j8oxjYV5LwBs4nnkYxRn2BXpahr0pA9JqlDn6Rsgg3hqhKhV5fBL2
         YVLkft3KRxsuqpmHkmeR0VuIsuLgoYukfVejOlnLkz9ewPpiJuKWOBoYOS2NdxbeqMvJ
         VD9w==
X-Forwarded-Encrypted: i=1; AJvYcCWKpwhnZ3etAYCznpzVkTMAHlnAr5N0WjHwPLMBcYA4ldpJ4FX1AijhH7g1LvjlhQ+LH+EnPY7tr34=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5fldn6GEbglQ0YtIAtGKkeg2NrCbbGhHApkiWleqJ5PbtCXJF
	cKmThqaiMtPDeS9RDIhZNJ00b7NkXQ1zlMQ7C2sURdVJ5ZgPZG6SrkTTagv6xQ==
X-Gm-Gg: ASbGncujXKBaUBtUSUVSvomB4Avn9UiOjOYCmg/M1jyMsNQ6zrwumE+sN8n0Bmn8eZi
	KcOQGTzKia6W38Tntzd+WuJpjxR/yih4kbLOgM6inRIqcX938qVimrsr7LrkyPaiKM/z8TJu2kR
	6Y9qxB8oZWvMyxtmeivjf/qielL6yvrl1WVGoqCtWrLRhhpG1ZGdQucFxZUqvpm30pvEUBmRm3D
	R0l6fmUqf7jOe7gdZXqvNxa+7eyTKZZBgPqV/7o3ZSyPGqZPgW+cK5uuF/YobT8MF00/AVOn4ff
	W4/sUZG5G30+Rs1sAe5Xj7Q1NfQM+m4kcbj/fpmltOHw
X-Google-Smtp-Source: AGHT+IH1L2+053HKjBANc7GI5t6N9eFdk9KEPgNwqaYsT0C/dL/Gef0yLBObqVY66eNPyS88Tua+Bw==
X-Received: by 2002:ac8:5e46:0:b0:471:bd14:a783 with SMTP id d75a77b69052e-477b3f4a757mr27665491cf.25.1743214131601;
        Fri, 28 Mar 2025 19:08:51 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::df1])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4778317b416sm18061541cf.50.2025.03.28.19.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 19:08:50 -0700 (PDT)
Date: Fri, 28 Mar 2025 22:08:47 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	syzbot <syzbot+c38e5e60d0041a99dbf5@syzkaller.appspotmail.com>,
	gregkh@linuxfoundation.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH v2 resend] media: dvb: usb: Fix WARNING in
 dib0700_i2c_xfer/usb_submit_urb
Message-ID: <24798648-c5a3-4e31-9897-4610053007f3@rowland.harvard.edu>
References: <29db5fdc-13c9-45f0-9183-c80d637725c6@rowland.harvard.edu>
 <Z-MKiV0Ei5lmWik6@shikoro>
 <d0fd60d7-5660-42ed-b1c7-4dfd6b8e74b0@rowland.harvard.edu>
 <Z-MrfICsY06DZV-2@shikoro>
 <f8e975a0-87d2-4f83-b580-6858050a252d@rowland.harvard.edu>
 <Z-QjIRoOWpoWaL6l@shikoro>
 <c6bed13c-38df-43a6-ba5f-0da03b91f3df@rowland.harvard.edu>
 <Z-RyiI1X9BN43feQ@shikoro>
 <c7f67d3b-f1e6-4d68-99aa-e462fdcb315f@rowland.harvard.edu>
 <Z-bEBk68dh918vy9@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-bEBk68dh918vy9@shikoro>

On Fri, Mar 28, 2025 at 04:45:10PM +0100, Wolfram Sang wrote:
> Alan,
> 
> > Fix the problem by adding the I2C_AQ_NO_ZERO_LEN_READ adapter quirk
> > flag to all the USB I2C adapter devices managed by dvb-usb-i2c.c,
> > following Wolfram Sang's suggestion.  This tells the I2C core not to
> > allow length-0 read messages.
> 
> Thank you again for fixing this issue. There are some USB-I2C bridges in
> drivers/i2c/busses which also do not prevent zero len reads. Would it
> make sense to put a protection into the I2C core? Can we reliably detect
> that an adapter sits on a USB (maybe via the parent device), so that we
> can then check if I2C_AQ_NO_ZERO_LEN_READ is set, and take action if
> not?

This really should be handled by someone who knows how those bridges 
work.

In the case of dib0700, it was clear from the source code that the 
driver uses USB Control transfers to tell the hardware about I2C 
messages.  I don't know if other bridges work in the same way.  In 
theory a bridge could use USB Bulk transfers instead; they aren't 
subject to this restriction on length-0 reads.  Or a bridge could use a 
Control read transfer but include extra header material along with the 
actual data, so that a length-0 message wouldn't end up generating a 
length-0 read.

So the short answer is that you would need to find someone who really 
understands what's going on here -- which I don't.  Sorry.

Alan Stern

