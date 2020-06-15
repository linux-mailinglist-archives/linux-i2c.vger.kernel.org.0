Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F4CF1F9E11
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jun 2020 19:05:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731176AbgFORFK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Jun 2020 13:05:10 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:42525 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729682AbgFORFJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 15 Jun 2020 13:05:09 -0400
Received: by mail-il1-f194.google.com with SMTP id j19so11839793ilk.9;
        Mon, 15 Jun 2020 10:05:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iil1Ct3yqqoRyLs7AUrfXx88B12vf8Oqs/d10YbLStk=;
        b=ocIDfO8gwGajAnK52Z1KfIoF28VT2M2o855vTzGDtnA6cI0MLrCEH746r+nQFof/MM
         YpBK31WIvpmLCK1xegqdZFOPxdcj9hXZv4ZaiYflROyH1Y0z+kIUPounYkAMfdl7+elU
         ZzCt2vL4iE1Q0SssBhLsBy303vPzu3zek8Jjy4J86zc/e83k42Y0TiapOZ/4I2rtXUda
         WoyffFCreIUilOQv0s6924vwxRAgOx1Cq46/OIkP//a0NirF+lW6fyv8tf3HpJHB/Vjr
         +onkvv3ocktNTL0mYW1IXDivd0IAxGvcqdinFwpX6Ta/JrIN7ldjdp9ABzOuueCut+mF
         cD5g==
X-Gm-Message-State: AOAM530A1WmkmMAcLoTVcwxaFmzqOm0FQ3KoD60M39PjbAri5C7p9GVg
        tf2jvFJGBTMqa9Nom3CJLQ==
X-Google-Smtp-Source: ABdhPJwc1Mh+mwwfssvJd2rCp7WiDQI7C4KOV3xgJBzwmOkCj5D8rBpAuHCNLWKgFfw7tkpvCelglg==
X-Received: by 2002:a92:244c:: with SMTP id k73mr27644530ilk.292.1592240708523;
        Mon, 15 Jun 2020 10:05:08 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id c23sm8274077ioc.28.2020.06.15.10.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 10:05:07 -0700 (PDT)
Received: (nullmailer pid 1959366 invoked by uid 1000);
        Mon, 15 Jun 2020 17:05:06 -0000
Date:   Mon, 15 Jun 2020 11:05:06 -0600
From:   Rob Herring <robh@kernel.org>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     s.hauer@pengutronix.de, Linux-imx@nxp.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux@rempel-privat.de, robh+dt@kernel.org, shawnguo@kernel.org,
        wolfram@the-dreams.de, kernel@pengutronix.de,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        aisheng.dong@nxp.com, festevam@gmail.com
Subject: Re: [PATCH V2 1/3] dt-bindings: i2c: Convert imx lpi2c to json-schema
Message-ID: <20200615170506.GA1959153@bogus>
References: <1591235358-15516-1-git-send-email-Anson.Huang@nxp.com>
 <1591235358-15516-2-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1591235358-15516-2-git-send-email-Anson.Huang@nxp.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 04 Jun 2020 09:49:16 +0800, Anson Huang wrote:
> Convert the i.MX LPI2C binding to DT schema format using json-schema
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
> Changes since V1:
> 	- add "additionalProperties: false".
> ---
>  .../devicetree/bindings/i2c/i2c-imx-lpi2c.txt      | 20 ---------
>  .../devicetree/bindings/i2c/i2c-imx-lpi2c.yaml     | 47 ++++++++++++++++++++++
>  2 files changed, 47 insertions(+), 20 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
> 

Applied, thanks!
