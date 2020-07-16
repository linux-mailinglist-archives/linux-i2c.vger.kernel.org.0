Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4154B222B97
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Jul 2020 21:10:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729010AbgGPTJi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Jul 2020 15:09:38 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:47021 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728400AbgGPTJh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Jul 2020 15:09:37 -0400
Received: by mail-io1-f65.google.com with SMTP id a12so7171663ion.13;
        Thu, 16 Jul 2020 12:09:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WmN0I5jfW0bngGda6eqXsjReLWui8Z/KXRe8dH1gHbE=;
        b=NtfI65fjrYZsp7P9PHJeVhmj8r5K40inEZuyuSLng/sKCa/y1Xybxe+ehi7tkDwpjl
         FIFMWE2hGZqnYKQXaJcn4f3ul/HhU3g6Va3yzg2wj5bvUvJHY06JjB2LqYdrOSxZla+i
         ARK+/cbw2fV0HpXclzXJWinAe0gbZTX8tZ/R071CzJ0273iMMKTVX6idFaJtNE8pwYFU
         tE4immoRqq1pzFGWS2eD4JzerR+3iYkpcmd++tzMDD5W4WibPcCQG2q4eOKlfUA/sLJe
         WsDky73fdGuwZq50QsJcFKdUBjAElRbKQgJfiqsFzSkZjCyI+OHNVV5iGyfi1WOjTwr3
         vBZw==
X-Gm-Message-State: AOAM5333BGxIljnVq1oOeeLcbBeZ1W+vrZ3QYOGLMGbpVD9itap10eK/
        HWxwjl3zV2ux8Cuv5CscGQ==
X-Google-Smtp-Source: ABdhPJz170yVZyP5HHq8yZ4vT1JgTt7Qg8B1Oju34HwKnwbZ5cGMadOJBmV9Tpy+Dj0KutJq5I1K3A==
X-Received: by 2002:a6b:8b11:: with SMTP id n17mr5857639iod.155.1594926576428;
        Thu, 16 Jul 2020 12:09:36 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id o64sm3126510ilb.12.2020.07.16.12.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 12:09:35 -0700 (PDT)
Received: (nullmailer pid 2680082 invoked by uid 1000);
        Thu, 16 Jul 2020 19:09:34 -0000
Date:   Thu, 16 Jul 2020 13:09:34 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     digetx@gmail.com, frankc@nvidia.com, hverkuil@xs4all.nl,
        gregkh@linuxfoundation.org, sboyd@kernel.org, sakari.ailus@iki.fi,
        devicetree@vger.kernel.org, helen.koike@collabora.com,
        thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-media@vger.kernel.org,
        robh+dt@kernel.org
Subject: Re: [RFC PATCH v3 11/18] dt-bindings: tegra: Update VI and CSI
 bindings with port info
Message-ID: <20200716190934.GA2680032@bogus>
References: <1594786855-26506-1-git-send-email-skomatineni@nvidia.com>
 <1594786855-26506-12-git-send-email-skomatineni@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1594786855-26506-12-git-send-email-skomatineni@nvidia.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 14 Jul 2020 21:20:48 -0700, Sowjanya Komatineni wrote:
> Update VI and CSI bindings to add port and endpoint nodes as per
> media video-interfaces DT binding document.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  .../display/tegra/nvidia,tegra20-host1x.txt        | 92 +++++++++++++++++++++-
>  1 file changed, 90 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
