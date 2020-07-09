Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 797EB21AB83
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Jul 2020 01:25:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726772AbgGIXZT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Jul 2020 19:25:19 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:41183 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726222AbgGIXZS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Jul 2020 19:25:18 -0400
Received: by mail-il1-f196.google.com with SMTP id q3so3505205ilt.8;
        Thu, 09 Jul 2020 16:25:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PXrhidXAYpHgJ5A1zfsaViW170f8YexLRVqFFy8RY/c=;
        b=CoHlkUMzLpWkuoq1BjLfN6mXy0dKLWnMzx2r3PWhJUKRsW8FVpSsFdgoBetmPS8MGR
         fi80s5wVd/L1Q3wiw7mmx3aNESQ4D2DlkvxWoxjStdI/VHFLAKqb6U4AS59yqqd9IYTu
         UG5SYbvpJH3XBo4KJ0SmA5VCZTocyJFmVO8PnvRIPmSHHgU+EwnXmaDTKvQXaT7KuaMz
         88LnsT2Ojn5v/odITi0Skw6lJ214cDhaxVMz7emhY65KNk8GFzJV0un2/oAY1LnTiZ18
         FanUs6T2PQz6FgqkFcjMZlpD6lBlSwjWrITY2m84TC2m2Xz+JnBgubpiFT/u/9FQNZ1p
         vxJg==
X-Gm-Message-State: AOAM530fborSF9xNByJ9D/TxK2SXDtzJHgI1Q7cLBWaeECM4B+AOR7wZ
        xZaKUSYaHd5X3ol0qzAXWw==
X-Google-Smtp-Source: ABdhPJz+sCGtaNOGJjBqfJDxwmiYliI+H+mZAltp9t+Hmr+fTaxn5oIL3q39psHUShfZ+M33Yo33Rg==
X-Received: by 2002:a92:d811:: with SMTP id y17mr44950299ilm.35.1594337117775;
        Thu, 09 Jul 2020 16:25:17 -0700 (PDT)
Received: from xps15 ([64.188.179.254])
        by smtp.gmail.com with ESMTPSA id u62sm2619663ilc.87.2020.07.09.16.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 16:25:17 -0700 (PDT)
Received: (nullmailer pid 1093400 invoked by uid 1000);
        Thu, 09 Jul 2020 23:25:15 -0000
Date:   Thu, 9 Jul 2020 17:25:15 -0600
From:   Rob Herring <robh@kernel.org>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     devicetree@vger.kernel.org, linux@rempel-privat.de,
        shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel@pengutronix.de, s.hauer@pengutronix.de,
        wolfram@the-dreams.de, festevam@gmail.com, Linux-imx@nxp.com,
        robh+dt@kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 2/2] dt-bindings: i2c: Convert imx i2c to json-schema
Message-ID: <20200709232515.GA1093270@bogus>
References: <1592279454-32551-1-git-send-email-Anson.Huang@nxp.com>
 <1592279454-32551-2-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1592279454-32551-2-git-send-email-Anson.Huang@nxp.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 16 Jun 2020 11:50:54 +0800, Anson Huang wrote:
> Convert the i.MX I2C binding to DT schema format using json-schema,
> some improvements applied, such as update example based on latest DT
> file, add more compatible for existing SoCs, and remove unnecessary
> common property "pinctrl".
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
> Changes since V2:
> 	- remove 'clock-frequency' property's type and use enum for it, ONLY support 100KHz/400KHz.
> 	- remove *-gpios's typs/description, since it is already defined in i2c-gpio.yaml.
> 	- fix space issue in example.
> ---
>  Documentation/devicetree/bindings/i2c/i2c-imx.txt  |  49 ----------
>  Documentation/devicetree/bindings/i2c/i2c-imx.yaml | 103 +++++++++++++++++++++
>  2 files changed, 103 insertions(+), 49 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-imx.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-imx.yaml
> 

Applied, thanks!
