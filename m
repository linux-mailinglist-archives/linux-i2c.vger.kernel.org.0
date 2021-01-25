Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13FBE302EF4
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Jan 2021 23:26:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732229AbhAYWSD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 25 Jan 2021 17:18:03 -0500
Received: from mail-oi1-f180.google.com ([209.85.167.180]:44695 "EHLO
        mail-oi1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732214AbhAYWRs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 25 Jan 2021 17:17:48 -0500
Received: by mail-oi1-f180.google.com with SMTP id n7so4578939oic.11;
        Mon, 25 Jan 2021 14:17:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RLRNxLdbjcIib2t7EG9VlILmttoXFEtriJfY98lsTlI=;
        b=L07vCOXwcZ1jxbLVIy5X9Y6kB2VhPcTlFuZG37tln54XKq7Do2iewwWMN3ZxjnP3xx
         diY1ATy2UCNgzmh3iTBEHXIdFh/GxYPAMwH7XZripY3rmMIM0X8RIdYhfUBLRX429Tab
         UBX108b40c7SzxQJMP8vSYihyfh0aHuPUO++PPgLnX8FcT5XuT4s0MKYNkpmMpy3dco8
         yIKddewCLVZwe5ANkkpE0kpn3hY3h9jeHZWVML4j1xEe1Aucm8oAgG2cBy+FmBFpQnFc
         9v7u5vSWpAWAHqFCoVJgtwRevW3sMHpwDP1CePkmmzIwa/k+qDHXwK/J6AZetPQcEoeN
         O1bQ==
X-Gm-Message-State: AOAM530tXxTm6ldZYSroWJNKXqpGWIkGcgP8/6/fe57IAk8KuPaxXZ6R
        OJdQik3g6FXUrTTpZ+Fw5A==
X-Google-Smtp-Source: ABdhPJyFrYSbDviP8SU/kSLjJ70FJox5duKMjs2k7U8ygCTZe3VAmTvJ7a92ZCoZXgNBxQiEhpiNSA==
X-Received: by 2002:aca:f382:: with SMTP id r124mr1396387oih.175.1611613027750;
        Mon, 25 Jan 2021 14:17:07 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r2sm3738810oie.1.2021.01.25.14.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 14:17:05 -0800 (PST)
Received: (nullmailer pid 1118737 invoked by uid 1000);
        Mon, 25 Jan 2021 22:17:03 -0000
Date:   Mon, 25 Jan 2021 16:17:03 -0600
From:   Rob Herring <robh@kernel.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org, linux-i2c@vger.kernel.org,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        bjorn.andersson@linaro.org, linux-kernel@vger.kernel.org,
        martin.botka@somainline.org, robh+dt@kernel.org, agross@kernel.org
Subject: Re: [PATCH v3 3/3] dt-bindings: i2c: qcom,i2c-qup: Document noise
 rejection properties
Message-ID: <20210125221703.GA1118681@robh.at.kernel.org>
References: <20210114180415.404418-1-angelogioacchino.delregno@somainline.org>
 <20210114180415.404418-4-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210114180415.404418-4-angelogioacchino.delregno@somainline.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 14 Jan 2021 19:04:15 +0100, AngeloGioacchino Del Regno wrote:
> Document the new noise rejection properties "qcom,noise-reject-sda"
> and "qcom,noise-reject-scl".
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> ---
>  .../devicetree/bindings/i2c/qcom,i2c-qup.yaml      | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
