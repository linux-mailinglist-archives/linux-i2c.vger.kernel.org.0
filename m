Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64E5042E250
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Oct 2021 21:56:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232013AbhJNT6m (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 14 Oct 2021 15:58:42 -0400
Received: from mail-ot1-f52.google.com ([209.85.210.52]:44888 "EHLO
        mail-ot1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230495AbhJNT6l (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 14 Oct 2021 15:58:41 -0400
Received: by mail-ot1-f52.google.com with SMTP id d21-20020a9d4f15000000b0054e677e0ac5so9720835otl.11;
        Thu, 14 Oct 2021 12:56:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+UpI6wqSTxFiL18kFicbrj6BWfT7mLqkGyUBGSP3spA=;
        b=A7H8pCK/zsYtoUaAhjvwFdyJs4w2wxJJpMCVXR+ByoBz4ltVbNqEyJPPCU1tt01HhU
         vbmRKOtu76tYGd9981WYtXuat6Rq4viQ79oXFdGwy6l+gljKIITR1v9qDxD54at8WbrW
         et2cCnJOOyvw/LsZzYoQKeR2DFCSDtKJ2UZBNNCNukm2d8M8kaLKu+53o0cj6UHwga/q
         y51UmrBCQby0FjWxWke/CehgB8/kCHesDzRLTubgOUl1qZRKQEiQr7RUzoU09egwpxrb
         MZ7S8+U6KR61xkOFUOi2QRfR0i74x3czHNZuYEQS/sJbtSDfXOkgMsoP7Aqzrceirraq
         R+SA==
X-Gm-Message-State: AOAM531knGNIECLPyYvQ5leZrLfGNxyNPGgBTZFuXuaS7rj4/RnTZqqj
        fLfmlZmYPrUUnUsY/ihQfw==
X-Google-Smtp-Source: ABdhPJy8vVocS9sGDBQom+V8RWB+pZltqFtXthdNOfr3yFurPtZ1mD4kkLXqeCKmpWqIT5iBVuOluA==
X-Received: by 2002:a9d:3c3:: with SMTP id f61mr4134756otf.196.1634241396076;
        Thu, 14 Oct 2021 12:56:36 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id g29sm759491oic.27.2021.10.14.12.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 12:56:35 -0700 (PDT)
Received: (nullmailer pid 3817378 invoked by uid 1000);
        Thu, 14 Oct 2021 19:56:34 -0000
Date:   Thu, 14 Oct 2021 14:56:34 -0500
From:   Rob Herring <robh@kernel.org>
To:     Abel Vesa <abel.vesa@nxp.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        Fabio Estevam <festevam@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-serial@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
        linux-i2c@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
        devicetree@vger.kernel.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Dong Aisheng <aisheng.dong@nxp.com>
Subject: Re: [PATCH v3 08/11] dt-bindings: fsl: scu: Add i.MX8DXL ocotp
 binding
Message-ID: <YWiLcvqlBgj9ceUy@robh.at.kernel.org>
References: <1633526764-30151-1-git-send-email-abel.vesa@nxp.com>
 <1633526764-30151-9-git-send-email-abel.vesa@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1633526764-30151-9-git-send-email-abel.vesa@nxp.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 06 Oct 2021 16:26:01 +0300, Abel Vesa wrote:
> Add i.MX8DXL ocotp compatible to the SCU bindings documentation.
> 
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> ---
>  Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
