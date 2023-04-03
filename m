Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E27F6D3B32
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Apr 2023 02:53:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229468AbjDCAxK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 2 Apr 2023 20:53:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjDCAxK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 2 Apr 2023 20:53:10 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2A5E83D7;
        Sun,  2 Apr 2023 17:53:08 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id l18so20588009oic.13;
        Sun, 02 Apr 2023 17:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680483188;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OBu5UaNjkNwzsbUn0TKWijnYuBW78y5XFl9tNfZBjEM=;
        b=khzDCO8hOm1isewEetnwxLcDol7D0eG3maTtIquV8R5OkcesqMUf729ueUnChIpW9a
         p3oa5F9Je8RibpDHwwce9z0nodkK3wHxuoxAKgXoqJtOFtcmNKRGqZf6LeMm6dKNJ9VW
         odilhtryOjsPdeOpeWwwHzS3PkGgW2b2dk97232si4gS+8su+dayUKsO4dD2RcwK/ePc
         O9d0lmJSF+wN7bImEKVyywknru7kdbWOxm6bEJZHSAcO5NBdMuFQemsgpUGiPSrrXAJn
         Dlp0z8KLpyaYfbPEbWmt1+kE8cRUKq6Xg2caap+tjg21Hxb1ouLBOyScOdyd8BKAhxsu
         S2zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680483188;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OBu5UaNjkNwzsbUn0TKWijnYuBW78y5XFl9tNfZBjEM=;
        b=qORIXlJ4y9PEgPsqKSN4ZZytaI+ERqjyxhcjXnz7wRypzl+WM0rGr50RmkiGnnsuMP
         HSew6ZecGmTZmJTbfxdMWVGUlRm7x37+fcxtWD3Sc7NKXW8xN1Eyl50r7OhF2Ykx8yC1
         vhWmlSSrBME3SbGI1AMaJKb7+Pi0lFs/1xM7fpeV5V8zM6Dnua6hm6fyVH7SzNfOb5d+
         8pLNXsOTRyagWdbO/X3ESHS6C44Tu0q2M/zb3VZT+7nlWP/q7wY3TSNteLm9DbH0gEqV
         hHyOFy3G/sQZnUwLlHBeC3tohUjEW2BkxOGygAzdZGfPC3bwqw9348vMbedN1Q9fiYNz
         CKgA==
X-Gm-Message-State: AO0yUKV4aekDAwaec6e6M/7IeHakZfkPn7NJddKBgi3xgZGbkCshTyjE
        qUfYhWtikMFIaEaJUeGz33tTju2Sjgc=
X-Google-Smtp-Source: AK7set/hG9QrSNrJ6GkJhhODkeJF23wltyptxaRbHP4H74dbS7c4+CMqjWJu9VqtQ6HcGYp11zdH6Q==
X-Received: by 2002:a05:6808:ab0:b0:386:d10c:16fb with SMTP id r16-20020a0568080ab000b00386d10c16fbmr14473206oij.2.1680483188043;
        Sun, 02 Apr 2023 17:53:08 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w8-20020a056808018800b003896b3269d3sm3297235oic.20.2023.04.02.17.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 17:53:07 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sun, 2 Apr 2023 17:53:05 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Daniel Matyas <daniel.matyas23@gmail.com>
Cc:     linux-iio@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-hwmon@vger.kernel.org
Subject: Re: Creating a driver for MAX31827 temperature switch
Message-ID: <e294bbdd-999b-4629-9b8d-046ccb834835@roeck-us.net>
References: <ZCn0KeOQFJclqiAK@daniel-Precision-5530>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZCn0KeOQFJclqiAK@daniel-Precision-5530>
X-Spam-Status: No, score=0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,
        FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Apr 03, 2023 at 12:31:21AM +0300, Daniel Matyas wrote:
> Dear Kernel community,
> 
> I am developing an IIO driver for a temperature switch, which communicates through I2C at Analog Devices Inc.
> 
> When implementing the event handling for the comparator mode of the device, I faced a problem: I don't know how to differentiate the underTemp event from the overTemp event. To understand better, I suggest you check out the device's data sheet for Address map (page 12), Configuration Register Definition (page 13) and OT/UT Status Bits and ALARM Pin Behavior (page 15) - https://www.analog.com/media/en/technical-documentation/data-sheets/MAX31827-MAX31829.pdf
> 
> I had the idea to make 2 channels with the exact same attributes, but with different indexes, so that I can store the overTemp related events on channel 0 and underTemp related events on channel 1. Even so, I don't really feel like this is the right solution. Can anyone give me some advice on this?
> 
> Also, I was suggested that I convert my driver from IIO to HWMON. Do you think that this is needed?
> 

This is a typical hardware monitoring chip, and the driver should be a
hardware monitoring driver.

Guenter


> Yours faithfully,
> Daniel Matyas
