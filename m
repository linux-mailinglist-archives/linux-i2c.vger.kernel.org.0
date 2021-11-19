Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C98E045672F
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Nov 2021 02:02:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233876AbhKSBFQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Nov 2021 20:05:16 -0500
Received: from mail-ot1-f52.google.com ([209.85.210.52]:41729 "EHLO
        mail-ot1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233866AbhKSBFQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 18 Nov 2021 20:05:16 -0500
Received: by mail-ot1-f52.google.com with SMTP id o15-20020a9d410f000000b0055c942cc7a0so14102892ote.8;
        Thu, 18 Nov 2021 17:02:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CkvOGukepe0pwqXDVePd7L8wIO5UVW/SmacY98enZ7w=;
        b=70klxGLQylNp3WkblISXpdA+Pli2rF5NTMWWeDTXYMewnexG/lWnVpQIHuSsqEZEOG
         J/CV06I9uyV3+yZQhxooZMuO2zq76J93SYVsh7EYVAHEzHq++deqRsa3HxaJLDeD9hhO
         sSqHyxA5v4XVvXCWR6QZXofmDjUoX8jwARk7/Gtn/M6s3YS8310zDDKq+oISV6cRQngp
         rnGUHYxN1C2rGtdoQ/0O0b0+lb6vX4deGjgKSwJwW8d+ZNQMBfRAkrc9GrN7kIBXhnTr
         LxMg9XkDKy3E71cH1rjkbR45U4SKHxofXa0pHPp5OsbIOmigRsYlhKy8yDFPtwe1G9xV
         EkCg==
X-Gm-Message-State: AOAM531SFrhdEEDnilazWPKT+FTIoXNm/Bswil5p2P5akwF6U9PtPwPZ
        M6u/59BOcbxgwrT4PYz8eg==
X-Google-Smtp-Source: ABdhPJzg3QI+QmbZhwnyyJIRAVet5zdo9XTsm9vNJ/P6SuzDq+eGI6EaV7ukfruq6PywE2kX3qm3bg==
X-Received: by 2002:a9d:2486:: with SMTP id z6mr1329903ota.210.1637283735199;
        Thu, 18 Nov 2021 17:02:15 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id k17sm276660oom.6.2021.11.18.17.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 17:02:14 -0800 (PST)
Received: (nullmailer pid 2139980 invoked by uid 1000);
        Fri, 19 Nov 2021 01:02:13 -0000
Date:   Thu, 18 Nov 2021 19:02:13 -0600
From:   Rob Herring <robh@kernel.org>
To:     Abel Vesa <abel.vesa@nxp.com>
Cc:     devicetree@vger.kernel.org, linux-serial@vger.kernel.org,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        linux-i2c@vger.kernel.org, Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v4 11/12] dt-bindings: i2c: imx-lpi2c: Add i.MX8DXL
 compatible match
Message-ID: <YZb3lVvHTOcEFiT0@robh.at.kernel.org>
References: <1636566415-22750-1-git-send-email-abel.vesa@nxp.com>
 <1636566415-22750-12-git-send-email-abel.vesa@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1636566415-22750-12-git-send-email-abel.vesa@nxp.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 10 Nov 2021 19:46:54 +0200, Abel Vesa wrote:
> Add i.MX8DXL lpi2c compatible to the bindings documentation.
> 
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
