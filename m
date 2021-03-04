Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 579C232D385
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Mar 2021 13:48:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231342AbhCDMrq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 4 Mar 2021 07:47:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231334AbhCDMrS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 4 Mar 2021 07:47:18 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD01FC061574;
        Thu,  4 Mar 2021 04:46:37 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id v15so27518816wrx.4;
        Thu, 04 Mar 2021 04:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=t995YwXNggdE7Q1D7x8Y8KxbhiqNrAGwgCOjk7PvDGc=;
        b=WTVfjVfVPlpKlPSZ8mQTQXPwEHz0TH5ThgWFJ3mkd9VQWhALHMr9//IOudbvA0em7M
         SaOaQKxzpxB1DCPkbrryml+S6lgJAvZYoNQxhljVhIE+lH7WhM0hbxUujmubtTzeRRIA
         P0WkIG/GS3w5Ne12QVtoZ3aC66rUL5m856JvADozH0RKLZMs2UaVl7SfDnVX+Xs5+beF
         kyZVn1P2OhhCAS80tcOG3WvZPKoSIUxuCnuHTROq3rwIzasoI36UWnAsuZ18rcvmyVNa
         t2HfJZKCkqKHirZEbchpuG4QiQ8Wx+hnzSzKR//sRGCyeoCCvmvHDioom27EVkudyHxW
         Ak+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=t995YwXNggdE7Q1D7x8Y8KxbhiqNrAGwgCOjk7PvDGc=;
        b=o+Y8FzRvjuMeiu75UDI1IW2y/gcIx8+VYTTqncD/S6E+lXJNWAqpfX7HRg+VK3ZRtD
         v662hqgdBfRhASaUa7G2P5WPaP5bNZcDbqVDPb5Ij9xSw33u9hIUSOnrinRX9N8lXy17
         FbeoZLkoyFdXdKEqRJD4qPErOlXgmQ0R/8z66JR0tt9GIaysmZg0s+AFJqicnKdnDSzb
         28wcS0SPshkxnabOF4OXu2usa3xdQix3xdeD9QSZCm2py/eEfyayPytwpGmLDy2v+yM9
         7F0ct/rt39ka8bMZrV2Ve4hnEVNDdFVY7AdDgAri/f/ALZyth82Jt6uj1zth/H8mlhs4
         2NzA==
X-Gm-Message-State: AOAM532V3Mza0nnz1aPW4Joj2js18bT0LwX4vmm9/Oc3zyyJJ/QfdMvg
        O5qLAkipIYFR289s6PjHnlA=
X-Google-Smtp-Source: ABdhPJxau/ellTjaf+yJJ4ZuvH6W9Zg+/qoqiYVHZT6MVIIP7GDVzaDcu77FUb1SGxUCr1lroG84sw==
X-Received: by 2002:a5d:6d06:: with SMTP id e6mr3839052wrq.425.1614861996566;
        Thu, 04 Mar 2021 04:46:36 -0800 (PST)
Received: from michael-VirtualBox (89-139-118-26.bb.netvision.net.il. [89.139.118.26])
        by smtp.gmail.com with ESMTPSA id a21sm11845162wmb.5.2021.03.04.04.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 04:46:36 -0800 (PST)
Date:   Thu, 4 Mar 2021 14:46:33 +0200
From:   Michael Zaidman <michael.zaidman@gmail.com>
To:     Aaron Jones <aaron.jones@ftdichip.com>
Cc:     jikos@kernel.org, benjamin.tissoires@redhat.com, wsa@kernel.org,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCHv2 1/1] HID: ft260: add usb hid to i2c host bridge driver
Message-ID: <20210304124633.GA23038@michael-VirtualBox>
References: <20210219163644.2811-2-michael.zaidman@gmail.com>
 <20210304111406.3482-1-aaron.jones@ftdichip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210304111406.3482-1-aaron.jones@ftdichip.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Mar 04, 2021 at 11:14:06AM +0000, Aaron Jones wrote:
> From: Aaron Jones(FTDI-UK) <aaron.jones@ftdichip.com>
> 
> On Fri, Feb 19, 2021 at 06:36:44PM +0200, Michael Zaidman wrote:
> > The FTDI FT260 chip implements USB to I2C/UART bridges through two
> > USB HID class interfaces. The first - for I2C, and the second for UART.
> > Each interface is independent, and the kernel detects it as a separate
> > USB hidraw device.
> >
> > This commit adds I2C host adapter support.
> >
> > Signed-off-by:Michael Zaidman <michael.zaidman@gmail.com>
> 
> I've applied the patch, ran some tests with a UMFT260EV1A evaluation board,
> and found no issues with the functionality it provides.
> 
> Tested-by: Aaron Jones (FTDI-UK) <aaron.jones@ftdichip.com>

Aaron, thanks for giving it a try - much appreciated!

I will add your "Tested-by:" to the next version of the patch
once I receive any feedback.
