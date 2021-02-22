Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BAC0321B24
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Feb 2021 16:18:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231349AbhBVPRH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Feb 2021 10:17:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231404AbhBVPPX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 Feb 2021 10:15:23 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71B34C061574;
        Mon, 22 Feb 2021 07:14:19 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id e17so58914240ljl.8;
        Mon, 22 Feb 2021 07:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hq2/gvw9RtoaQB1TB4erX0u+6dSXoT0qR4ybLmvRHog=;
        b=J8ZPYlqPoWUSAZrJqGyUKqmxz97aSVUyQh0z+7l0YNAJ8roetNbI3bgQBXY2VWxHCI
         9GtXreYDeWnhC47FBlDciZpwVy8ZhkW5iHFmO6geR05L76gllbnp/oQWkRjP4sEbvUKr
         nFBcl7D+6ixsqOnjGvLi7p5zGnzPhkUpK7Ojvnoe0u+ugdn6eo7aIRiuzbSlKlAtK6XY
         UaqEKxcvUhc0PsQpFTmqmGAu522CbIkOcBp8BTsPLC5GOdRlO+RxMUMbh6JjiFmKfvc7
         6o2qaU2j48cgs3RqaxvtiXOpB20mlaqnJ4gEkCO8X/0OCDPEr3uTKJsL91igY4ET1WXL
         nabQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hq2/gvw9RtoaQB1TB4erX0u+6dSXoT0qR4ybLmvRHog=;
        b=Eef+H+OOhtjog13moESnyMZkY4ZXxlxac+z2S6PBYbaHzJxzY6nTpxuNBEo1zSmR3T
         p/kWHFgvMWLNYG1gbbcnCumKR2UjpbCJkp1gQ0fjr4fohWidngWIf7k/TZ3szolWd20O
         /uePLciJ1zAr+15cLxFq/65+wWdO3eKmXpNv3aXZDGs+vxPfZZ22s6DnwjQ21tPjeKiD
         LSQOBCAxRo2m9Rlkw0XPNTiItXjdSo5+70iE1I6MNy0LRHOd8Zn4MZ7XnUy65YyLK5hC
         3h32SbMa68nBvEPeSc/TLyyeP914f9wqa0p/XgRLwlGj/5tmCb1tSqK4QcIWLLAZn1pB
         Jasw==
X-Gm-Message-State: AOAM530lTiUfZ5GaVdcIplpsHoNWuJ6aeZ0lzMXC+v53Zg5zJh0BBJTB
        5NFQ5US7YnQBLdKoE/u4yNw=
X-Google-Smtp-Source: ABdhPJyVoh2nz4TTvTVYRiKOXHcdcmJ0zW4Zt6T3Rif/FkAR+cNVhnQKSr3OUx9SH3ib6N50kFfXPQ==
X-Received: by 2002:a05:651c:338:: with SMTP id b24mr14177795ljp.157.1614006858048;
        Mon, 22 Feb 2021 07:14:18 -0800 (PST)
Received: from localhost ([104.193.8.209])
        by smtp.gmail.com with ESMTPSA id x6sm734695lfn.114.2021.02.22.07.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 07:14:17 -0800 (PST)
Date:   Mon, 22 Feb 2021 23:14:15 +0800
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     Robert Richter <rric@kernel.org>
Cc:     corbet@lwn.net, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        bhelgaas@google.com, wsa@kernel.org, linux-doc@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] PCI: Introduce pcim_alloc_irq_vectors()
Message-ID: <20210222151415.GA896979@nuc8i5>
References: <20210218150458.798347-1-zhengdejin5@gmail.com>
 <20210218150458.798347-2-zhengdejin5@gmail.com>
 <YC/NxfsQn2RKkrp8@rric.localdomain>
 <20210219164649.GA814637@nuc8i5>
 <YDONyMSHO9FDeY69@rric.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YDONyMSHO9FDeY69@rric.localdomain>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Feb 22, 2021 at 11:56:08AM +0100, Robert Richter wrote:
> On 20.02.21 00:46:49, Dejin Zheng wrote:
> > > On 18.02.21 23:04:55, Dejin Zheng wrote:
> 
> > > > +	if (!dr || !dr->enabled)
> > here checks whether the pci device is enabled.
> 
> What is the purpose of this? The device "is_managed" or not.
>
The device is managed or not by check whether "dr" is NULL. And
check the "dr->enabled" is for the PCI device enable. I think it
may not make sense to apply for irq vectors when PCI device is not
enabled.

PCI device enable by call pci_enable_device() function, this function
initialize device before it's used by a driver. Ask low-level code
to enable I/O and memory. Wake up the device if it was suspended.

So I think it might be better to return to failure when it is found
the PCI device is not enabled in the pcim_alloc_irq_vectors() function.
It can facilitate developers to find problems as soon as possible.

BR,
Dejin
> -Robert
