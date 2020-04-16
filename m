Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 296C81ACA63
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Apr 2020 17:34:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729242AbgDPPeh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Apr 2020 11:34:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730236AbgDPPed (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Apr 2020 11:34:33 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C44DC061A0C;
        Thu, 16 Apr 2020 08:34:33 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id nu11so1522511pjb.1;
        Thu, 16 Apr 2020 08:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jsditFk3QKLKaKpu5zzpEVcrt2IGRFih4NDFzQtyXXs=;
        b=nPBqXI8RiRZdfS2zVTNjKBcFjW1AiNA5GXKlCRD34qCrxOunxJDlcKSBtTdBkx6LaO
         3kiYSF4SvFi1mAc85MycEMHgdDdf6UhULXycpoUNdccUqkntP9dMagf8d76xDPmXKbHn
         5YHzNTQNT5pvW2CkY28qT/FVpsWqEu+1yJfzFoS6ye616yzbWocIlqVOmyvJ2HRI1Rm6
         dDJ0gq95XZ3IckajpWuAr/2rIuYp3da+APc4yMjPY42rRrbLfGts4cqcr82J+6qW0YZ9
         NYpY0tWmByLIT2EqOg68uaMX3KBDbSx7l19DNhKh2utV0DLkYcg5MfYPj8fo0XonnZGy
         LAXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jsditFk3QKLKaKpu5zzpEVcrt2IGRFih4NDFzQtyXXs=;
        b=Jei8QuvZJX1RyfOt0dBEadtx/Z4gq+z5NwWnqDZLfNWG7ehJAVnhl7Ai5fITfCE44t
         YDecjAyGVQchVHcyqaVPxURAY1jiRgGU9167zpeBM4BiDeEcViULzjbfSn0BiSg++u1r
         NZVWT9odTt7JnEccwGr/QIr5br4pj7BvofBS+raEZNHs5CzgginfhdMdHqSky38m3Bto
         oE3iS1ZFain16qNAtu9OzRzn3s7nxPAmrn0XErVfmE/iy+rVjS2iw2+AkwKpLvI9SSV4
         2tOnzuNN0DfRbU69rpwFkFY4p4LpnLNcoSpxutJg2rLPYpUZzb1tesg/UJSiXFpRyNmp
         S2nQ==
X-Gm-Message-State: AGi0PuYY7uchaComsIo7C+qK6rhNMoo7O+mU4l0gESoaYk4c8B7Y0Xeq
        +6QYXEbkajGRUdKHtF+epxw=
X-Google-Smtp-Source: APiQypIT7t86j5DQnRvr72mtBhKlm/8M5gvrfLGHQgJQXMiJ6n+DxQ1J8xQce7uQ5l2gqo1m2++oXA==
X-Received: by 2002:a17:90a:c24a:: with SMTP id d10mr5756020pjx.5.1587051272906;
        Thu, 16 Apr 2020 08:34:32 -0700 (PDT)
Received: from localhost ([89.208.244.140])
        by smtp.gmail.com with ESMTPSA id u15sm2897957pjm.47.2020.04.16.08.34.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Apr 2020 08:34:32 -0700 (PDT)
Date:   Thu, 16 Apr 2020 23:34:28 +0800
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Allison Randal <allison@lohutok.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Patrice Chotard <patrice.chotard@st.com>,
        Shah Nehal-Bakulchandra <Nehal-bakulchandra.Shah@amd.com>,
        Tang Bin <tangbin@cmss.chinamobile.com>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: Re: i2c: img-scb: remove duplicate dev_err()
Message-ID: <20200416153428.GA23125@nuc8i5>
References: <08564c03-3bbd-5518-1a9d-a40b8ca09f48@web.de>
 <20200415025426.GB14300@nuc8i5>
 <b5db65f5-f236-9e22-98df-07629a827738@web.de>
 <20200415152115.GA17519@nuc8i5>
 <668fe4da-56f2-8abe-1113-fa180f307524@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <668fe4da-56f2-8abe-1113-fa180f307524@web.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Apr 15, 2020 at 06:24:09PM +0200, Markus Elfring wrote:
> >> Would you like to take another look at corresponding change possibilities?
> >>
> > yes, I want to do it and thanks for your info.
> 
> This positive feedback can lead to corresponding software development opportunities.
> Which directions would you like try out next?
>
May be related to usb, ethernet and pcie. My current job is related to
these. Thanks!

BR,
Dejin

> Regards,
> Markus
