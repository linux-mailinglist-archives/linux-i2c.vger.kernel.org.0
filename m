Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B5AB60A26
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jul 2019 18:22:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728387AbfGEQWY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 5 Jul 2019 12:22:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:48634 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725730AbfGEQWX (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 5 Jul 2019 12:22:23 -0400
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CDC42218A3;
        Fri,  5 Jul 2019 16:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1562343742;
        bh=BfIZ6tKZCVBNxIWZMJzgLQLDrDM98KXngGyQEogUvuc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=F2XUZ0AsiObz38Qx97acqnLEtyiZgGiHacWy+UuMmsUAZJyO+KDJLw8FYplC9QPZn
         1TKYBoIBLF2IC3EmcGzM0b9XjavOgg5NQmwwvSRDtgTrFwD+ezXLUgku1I618QESPZ
         TsfEL/AU5M7NwZX3NfKhGm0FO5+MNz/tZJtu6ZKw=
Received: by mail-qt1-f178.google.com with SMTP id z4so8211829qtc.3;
        Fri, 05 Jul 2019 09:22:22 -0700 (PDT)
X-Gm-Message-State: APjAAAVDPyvLBKh7NQfi+BHzC0OSJ626wBBbK5UXF0xutHcYNBU6f573
        ZI/Q/rjsuk5WT9r5lkfyZxC422oygCQ6qECScg==
X-Google-Smtp-Source: APXvYqznIT4YElky20jKxqRkbKAWLxPbxOFcKpVR97IY2WHAR4eOb1KboDsmea/JxYWvnsvS6y441We6YElJY7mXJIY=
X-Received: by 2002:aed:3f10:: with SMTP id p16mr3422307qtf.110.1562343742119;
 Fri, 05 Jul 2019 09:22:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190703095338.11266-1-maxime.ripard@bootlin.com>
In-Reply-To: <20190703095338.11266-1-maxime.ripard@bootlin.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 5 Jul 2019 10:22:10 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLej_OAetF35vG7eraN5BheLu9fkit8Fw7NS0Ckx_HvZQ@mail.gmail.com>
Message-ID: <CAL_JsqLej_OAetF35vG7eraN5BheLu9fkit8Fw7NS0Ckx_HvZQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: i2c: mv64xxx: Fix the example compatible
To:     Maxime Ripard <maxime.ripard@bootlin.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Mark Rutland <mark.rutland@arm.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jul 3, 2019 at 3:53 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> One example has a compatible that isn't a valid combination according to
> the binding, and now that the examples are validated as well, this
> generates a warning.
>
> Let's fix this.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> ---
>  Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Rob Herring <robh@kernel.org>
