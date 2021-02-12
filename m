Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC0FD31A87B
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Feb 2021 00:56:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229796AbhBLXys (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 12 Feb 2021 18:54:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229648AbhBLXyr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 12 Feb 2021 18:54:47 -0500
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B7EFC061574
        for <linux-i2c@vger.kernel.org>; Fri, 12 Feb 2021 15:54:07 -0800 (PST)
Received: by mail-io1-xd2b.google.com with SMTP id n14so981621iog.3
        for <linux-i2c@vger.kernel.org>; Fri, 12 Feb 2021 15:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tl15hf4a3qDJzFWQtBeDbGIHgUK7tiRoMV8qUQz1Zgw=;
        b=ol7G5/37Sy1z4jBF9Or+7Ap8MOKNeI7PzvqC7XYpQkVJJLoEnPQvvdeXNRoeFZt6tE
         SASfe4KWgsNHwZ8h25qX4Yk3I0HNXzkbW//jIBZfrMM3AcRSHNkL2DX+NhWIpZe/K+ad
         BFmQ2II73czVMJxmUimrOCc+umFlBJ8hxWj0r6Fs/tGxATCR4RaoEfsrf5KWJn73+Oit
         WEbxApMlcDj0W3NS7hubfIrqIBkgmx2HiJqAhcYLIvATEaVBgFWD5YLE2zhX26GqSwgk
         VIEST/aKlOGXHG1OId632JdEQzOuhTEbgNMYqWceGq4RWS+VLIXDxNRdScJZnkGfnsRW
         HAzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tl15hf4a3qDJzFWQtBeDbGIHgUK7tiRoMV8qUQz1Zgw=;
        b=Kpi21T8l4ZMVU3I4anDYp6jLXWWkvN1QKZd7Zq9xoPvF5PSAsg0Pn4slQS3o+G4K8u
         JcKFjjx5gz4tr6uh9Y9OPOUhEDpQMbPImfllOAdGONlGLcrqoEZlOTMjFmR+rxId5cl1
         h9BPW5B96Z/WosRaeamfgF8RWUuW6k0x3dpiS6uEeUpAh27xkNn1ie/zB7u4fzq+Yhr4
         ywtJ8BkFMBYYd8OBfgCRvn3+D0bKZYoeMajVJIuGaC3vLF5jp69t69N8NvDrgx/gd4aN
         UhLZovR2+Xf8vWLP7WVapeDD1tDoy0JZyBGoWNSflIHPBtvBcHgbdBLvO5+w4LKof/lT
         +uGg==
X-Gm-Message-State: AOAM532/tYjWRb4WN5ANFZBdGL4g8Qx5yHsj4qzyhrYogfEe3kb4FV5c
        xdKD9o63PL6e7jbHNhtR7XCBPv/Ix69v7z2+JAIMnF1xbQxUKA==
X-Google-Smtp-Source: ABdhPJw07TeTKiRoDNPMkhiYSlYr7ThilsjCL4u4lGQvbVDQ7aKsCdfMFjXjXbQ9t6eZgrFPNa58qPVmNQaMaxrThYA=
X-Received: by 2002:a02:1c49:: with SMTP id c70mr4933589jac.136.1613174046872;
 Fri, 12 Feb 2021 15:54:06 -0800 (PST)
MIME-Version: 1.0
References: <CAA_a9x+ysAxT6T11S_M4pKenq2vDO762nnXUvAuXOCL7S9ozxg@mail.gmail.com>
In-Reply-To: <CAA_a9x+ysAxT6T11S_M4pKenq2vDO762nnXUvAuXOCL7S9ozxg@mail.gmail.com>
From:   Alex Qiu <xqiu@google.com>
Date:   Fri, 12 Feb 2021 15:53:55 -0800
Message-ID: <CAA_a9xLjrYpeV09YsGASsnayesO3iJRUDyiTndOK7F2u2U-c=Q@mail.gmail.com>
Subject: Re: Kernel Doc on Navigating I2C Sysfs for I2C Topology
To:     peda@axentia.se, Wolfram Sang <wsa@kernel.org>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Feb 10, 2021 at 11:04 AM Alex Qiu <xqiu@google.com> wrote:
>
> Hi Peter and Wolfram,
>
> I'm looking for some documentation online to guide hardware engineers
> on how to find out what logical I2C bus number to use for i2ctools in
> sysfs when they know the physical I2C topology (BMC physical bus
> number and MUX channels). I read through the doc under
> Documentation/i2c/, but didn't find any. I didn't find much on this by
> searching the Internet, either.
>
> Is it some doc that I can add to Documentation/i2c/ or
> Documentation/i2c/i2c-topology.rst? Any suggestions or thoughts?
>
> Thank you!
>
> - Alex Qiu

Friendly ping. :)

- Alex Qiu
