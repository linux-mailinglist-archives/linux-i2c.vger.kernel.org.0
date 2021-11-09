Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB7CE44A5EA
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Nov 2021 05:52:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242868AbhKIEzK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Nov 2021 23:55:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229832AbhKIEzJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 Nov 2021 23:55:09 -0500
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73EECC061764
        for <linux-i2c@vger.kernel.org>; Mon,  8 Nov 2021 20:52:24 -0800 (PST)
Received: by mail-pf1-x435.google.com with SMTP id g19so12293553pfb.8
        for <linux-i2c@vger.kernel.org>; Mon, 08 Nov 2021 20:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=JkapuSwOnwxCbVYO9bfegcqw8wgDzralipX1H1BuD5E=;
        b=Oq8Hop7UfqF6odaW6RoWQK/Dre2F5iWQRWQwE0ryorhq4KCyAzFVrKhpsKLelcCOLT
         eLaYcntMkP6D9l28kM3sfnjAoF0i4Dvr9OmjjZOTULC8HzEQysGVQnjrb3i+Q98U2OAk
         l5M4aVtDq7IlqDrbuwHzqPEsEQwrt5EMFmspVurem58kicyZcN4ZnLTNTy7G1Hsil7FD
         Zt60JANYdAcZ6/mS6y4fb+NsObX+3f0QIYGPkDzjNbPIOwh0TVqaIuEkaBIwYR6M5QpF
         cdmJ0JaW8GIpsnOkUlIIm2RItYNV/lYlysK6ElrG0MLDNtWOU603v7S6lGADLyH/FYYR
         kfgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=JkapuSwOnwxCbVYO9bfegcqw8wgDzralipX1H1BuD5E=;
        b=vWb2ecNXiAKJKc8bBt9K8a2sDl0f9QHpSnoE/h3yrYQRIGww4x1H/mM53bi72gdqbh
         FhG9U4mcz1Vu8x6sNg798FUP8wo46umomjvk0e1ZG9wk59hTVw1pYf2JxK0kzhRCrq4O
         Cvqj9iVguW18JPs6m0B5gyLUp6r4ZhaJiIkXp8bWhyjBydKyHbHyb0WcpyI3WuJ/HW9s
         TrOx4DS0EGVo/jQAHEL8SaYXjVGJE9FdOrWWun9WxhgmNkSo3LJsvGxQ0/tqqsdFvJJ1
         Zsm7I8gxI5amDlYcsRu6NzoPgT0QjFZAMSlrtzm+fj6MCmj0+L7hD4LZPfex0CmsjAgq
         UbRQ==
X-Gm-Message-State: AOAM531YKeUTbeE4FdY4oifqWvIFsMX/SR0jDJ2I3FoOj1cs385NVRIx
        +f0zhT7eUgiaIULoWzF8kBGjfg==
X-Google-Smtp-Source: ABdhPJzo3mMOKUdZsnUntoCNQmDl0+nv890fatGtqLtt0zBDXxYrbya9x8UXloTwjlz15zmjWW8Z9A==
X-Received: by 2002:a05:6a00:230d:b0:49f:b8ad:ae23 with SMTP id h13-20020a056a00230d00b0049fb8adae23mr5043480pfh.80.1636433543998;
        Mon, 08 Nov 2021 20:52:23 -0800 (PST)
Received: from localhost ([223.226.77.81])
        by smtp.gmail.com with ESMTPSA id na13sm976263pjb.11.2021.11.08.20.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 20:52:23 -0800 (PST)
Date:   Tue, 9 Nov 2021 10:22:21 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Vincent Whitchurch <vincent.whitchurch@axis.com>
Cc:     "Chen, Conghui" <conghui.chen@intel.com>,
        "Deng, Jie" <jie.deng@intel.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Wolfram Sang <wsa@kernel.org>,
        "virtualization@lists.linux-foundation.org" 
        <virtualization@lists.linux-foundation.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        kernel <kernel@axis.com>
Subject: Re: [PATCH 1/2] i2c: virtio: disable timeout handling
Message-ID: <20211109045221.xd6apt473jannag2@vireshk-i7>
References: <20211020064128.y2bjsbdmpojn7pjo@vireshk-i7>
 <01d9c992-28cc-6644-1e82-929fc46f91b4@intel.com>
 <20211020105554.GB9985@axis.com>
 <20211020110316.4x7tnxonswjuuoiw@vireshk-i7>
 <df7e6127-05fb-6aad-3896-fc810f213a54@intel.com>
 <20211029122450.GB24060@axis.com>
 <8592a48d-0131-86bf-586a-d33e7989e523@intel.com>
 <MWHPR11MB0030C3489F38FF2AAF7C3D0A908C9@MWHPR11MB0030.namprd11.prod.outlook.com>
 <20211103063745.utpphthou4angs4s@vireshk-i7>
 <20211103144241.GA27285@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211103144241.GA27285@axis.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 03-11-21, 15:42, Vincent Whitchurch wrote:
> The suggested timeout is not meant to take into account the overhead of
> virtualization, but to be used by the virtio device as a timeout for the
> transaction on the I2C bus (presumably by programming this value to the
> physical I2C controller, if one exists).
> 
> Assume that userspace (or an I2C client driver) asks for a timeout of 20
> ms for a particular transfer because it, say, knows that the particular
> connected I2C peripheral either responds within 10 ms to a particular
> register read or never responds, so it doesn't want to waste time
> waiting unnecessarily long for the transfer to complete.
> 
> If the virtio device end does not have any information on what timeout
> is required (as in the current spec), it must assume some high value
> which will never cause I2C transactions to spuriously timeout, say 10
> seconds.  
>
> Even if the virtio driver is fixed to copy and hold all buffers to avoid
> memory corruption and to time out and return to the caller after the
> requested 20 ms, the next I2C transfer can not be issued until 10
> seconds have passed, since the virtio device end will still be waiting
> for the hardcoded 10 second timeout and may not respond to new requests
> until that transfer has timed out.

Okay, so this is more about making sure the device times-out before
the driver or lets say in an expected time-frame. That should be okay
I guess.

-- 
viresh
