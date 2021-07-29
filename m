Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41FA33DAE4F
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Jul 2021 23:26:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233750AbhG2V0X (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 29 Jul 2021 17:26:23 -0400
Received: from mail-io1-f49.google.com ([209.85.166.49]:36425 "EHLO
        mail-io1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229913AbhG2V0W (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 29 Jul 2021 17:26:22 -0400
Received: by mail-io1-f49.google.com with SMTP id f11so8902860ioj.3;
        Thu, 29 Jul 2021 14:26:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XheI4ZwX+zGfIYe0vvNEspKeLVy9TmVcB42S1CkGzJs=;
        b=LuO79YKOWszAvTQXUY2raR4fyfce2Oiw8yRZ32xz4eZP8yMEwcliXTa/CWGLKjuVuB
         9OSxXfKsE2qFXVp53yZctbZvBfq3ULoisBeErZ+KzMwypAKcX25Nh0m1CkIpdty6Tsg7
         1Kev5K38Hpu4Pik0uGJcM/5G62/xA/G2KYG4YuI2eJDGJIbiPgwUA/IjiUJ3caDqaSd2
         d0rHdo8NPZt0rFyrkn6okK5T9zrZsZ3x8SIp8QgViL5fgzKYm1XwrXEDr2Sod8TPd7ed
         56hWLBAUyqiDVhxg5lSHmtMpuSMOHy+dG65xCZua04ugkfaDceAiERZca6Ss3KBV3Bcg
         HWmw==
X-Gm-Message-State: AOAM533IiEcyAUyEceNukOhCZgoO8ZlWystvJ/w57Ft5WQzmfSE7F8C+
        H18ZEtwOzXXhwqfDlAPNZw==
X-Google-Smtp-Source: ABdhPJz7AHWux0tuGA39MViTrWiSDazIdMkyqKsekygBwxn9Rm0PlmDwD1VPa/zvmpfmdML3vWYMYQ==
X-Received: by 2002:a05:6638:144e:: with SMTP id l14mr6177292jad.69.1627593977293;
        Thu, 29 Jul 2021 14:26:17 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id v16sm2524959ilh.70.2021.07.29.14.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 14:26:16 -0700 (PDT)
Received: (nullmailer pid 920627 invoked by uid 1000);
        Thu, 29 Jul 2021 21:26:15 -0000
Date:   Thu, 29 Jul 2021 15:26:15 -0600
From:   Rob Herring <robh@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-iio@vger.kernel.org,
        Sean Nyekjaer <sean@geanix.com>,
        Jonathan Cameron <jic23@kernel.org>,
        devicetree@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>,
        linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        Jose Cazarin <joseespiriki@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: iio: dac: ti,dac5571: Add TI DAC081C081
 support
Message-ID: <YQMc95w18dT/H4v8@robh.at.kernel.org>
References: <20210723183114.26017-1-laurent.pinchart@ideasonboard.com>
 <20210723183114.26017-2-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210723183114.26017-2-laurent.pinchart@ideasonboard.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 23 Jul 2021 21:31:13 +0300, Laurent Pinchart wrote:
> The TI DAC081C081 is compatible with the TI DAC5571 from a software
> point of view. Add a device-specific compatible string value with a
> fallback to "ti,dac5571".
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../bindings/iio/dac/ti,dac5571.yaml          | 24 +++++++++++--------
>  1 file changed, 14 insertions(+), 10 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
