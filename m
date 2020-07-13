Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0147021E402
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jul 2020 01:50:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726794AbgGMXt6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 13 Jul 2020 19:49:58 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:36780 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726750AbgGMXt5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 13 Jul 2020 19:49:57 -0400
Received: by mail-io1-f66.google.com with SMTP id y2so15441491ioy.3;
        Mon, 13 Jul 2020 16:49:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UHyenos/gOjNznjgGtTMdPBde8a7doL/E2F5z4MsQK4=;
        b=rI6Fv3hUNjXHgAmxqsRfe6RdxFUzmQGUF9dRvM3dsVMpD2AnOdWYyQK4R1K5DR6gOx
         Cb91yogt7grNj3jp3qQ+s4kn9jszCms6AzRrEol/qtLs2yeL7+S6B23nfWEaMwl0/7yN
         3QHlsVkhD0S/3AOivfxtTQh1T2nk6XpzeZ5Jba07yKpYd2/7+44CydPOAyGrLe4Z+ES8
         G9mLDvI80rgEEpPL0bqYkV9SMJHtDDJJv77qgZESA1sppa4bobslATwc7YzslMT8XdPT
         ylwLyvJ681pvJqkj2aVKc/1DdG1hLvZW2lTIo9FUqKJdXDEI8Rpo/jWEPHRI6va/mxdA
         fn/g==
X-Gm-Message-State: AOAM531ytaD6cAjQJXzacgxVbOIOpJ+mv+OMSHTCn4C5ZntGykFAQHgI
        bjNA5FZqsFXLO0vBSrVkdpu/yTdihl9M
X-Google-Smtp-Source: ABdhPJzfzaXdZE8vse9V7QWXDeRzevOTeaM6e8+2cA9sunwS0j0aDIbLLE5AFf0GuST9flOv9XFHgQ==
X-Received: by 2002:a02:8816:: with SMTP id r22mr2939355jai.128.1594684197253;
        Mon, 13 Jul 2020 16:49:57 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id u9sm8737169iom.14.2020.07.13.16.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 16:49:56 -0700 (PDT)
Received: (nullmailer pid 948459 invoked by uid 1000);
        Mon, 13 Jul 2020 23:49:55 -0000
Date:   Mon, 13 Jul 2020 17:49:55 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     sakari.ailus@iki.fi, gregkh@linuxfoundation.org, frankc@nvidia.com,
        robh+dt@kernel.org, digetx@gmail.com, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        thierry.reding@gmail.com, sboyd@kernel.org,
        linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        helen.koike@collabora.com, jonathanh@nvidia.com,
        devicetree@vger.kernel.org
Subject: Re: [RFC PATCH v2 01/18] dt-bindings: i2c: tegra: Document Tegra210
 VI I2C clocks and power-domains
Message-ID: <20200713234955.GA948428@bogus>
References: <1592358094-23459-1-git-send-email-skomatineni@nvidia.com>
 <1592358094-23459-2-git-send-email-skomatineni@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1592358094-23459-2-git-send-email-skomatineni@nvidia.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 16 Jun 2020 18:41:17 -0700, Sowjanya Komatineni wrote:
> This patch documents missing clocks and power-domains of Tegra210 VI I2C.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  .../devicetree/bindings/i2c/nvidia,tegra20-i2c.txt    | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
