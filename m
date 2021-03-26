Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9697349E78
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Mar 2021 02:13:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229972AbhCZBNP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 Mar 2021 21:13:15 -0400
Received: from mail-io1-f51.google.com ([209.85.166.51]:35768 "EHLO
        mail-io1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229962AbhCZBNN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 25 Mar 2021 21:13:13 -0400
Received: by mail-io1-f51.google.com with SMTP id x17so3838063iog.2;
        Thu, 25 Mar 2021 18:13:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zbkw9Y7KdSrwPhBVHuNS2fuewhP21jNF8VYuw+vghOQ=;
        b=V1L7V/Y6RhjKv8lWnCsPdqkZMCcSgoWa7GFWJn1y/9gHUd+aTT8UkLRxz1Pxjk4OO3
         vCOZze2nZ66+cInC7BGTaW0l0kRwHsdcGOdxw+Ucc1Y0WIuyDHJfwWlpsFuYEqJ9QVjI
         DMUI/8vRdcaEbxY6uFuwKOnR4o/JrEeWVKhRvWPtLjxBOrqJKIx+cndq1pUbdzBcAwBX
         Aecm8dHzb1P6AMAV+scGjhbv8kmFGojy7qABlS35+dDpdA0TKPdfGmXd7OacAGYQUwXq
         PsMDEQR1CeXoc8g0Zo+qbCOvvRyzDDOVWDNY5ECjxOD/C/nfMqKRHuE9TfTA8N6ViEHv
         thiw==
X-Gm-Message-State: AOAM5339oy8yEcPqtrfl0IOyqeyjY+tFymQxd6USiBUPeZrnQX6sZ591
        IbXrp7+UI3Zu3N+y7Ri7rA==
X-Google-Smtp-Source: ABdhPJz/kkzII6gaHn1Zz42FMOTzrlw/itwIj30ByvIYMFs2vADjcapKqUr0+yzTejwVWkn/CIALjA==
X-Received: by 2002:a05:6638:2101:: with SMTP id n1mr10049485jaj.7.1616721193112;
        Thu, 25 Mar 2021 18:13:13 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id d2sm3490299ilm.7.2021.03.25.18.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 18:13:12 -0700 (PDT)
Received: (nullmailer pid 2102175 invoked by uid 1000);
        Fri, 26 Mar 2021 01:13:10 -0000
Date:   Thu, 25 Mar 2021 19:13:10 -0600
From:   Rob Herring <robh@kernel.org>
To:     Alain Volmat <alain.volmat@foss.st.com>
Cc:     wsa@kernel.org, mark.rutland@arm.com,
        pierre-yves.mordret@foss.st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@foss.st.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        fabrice.gasnier@foss.st.com
Subject: Re: [PATCH v2 1/2] dt-bindings: i2c: stm32f7: add st,smbus-alert
 binding for SMBus Alert
Message-ID: <20210326011310.GA2090957@robh.at.kernel.org>
References: <1616075089-28115-1-git-send-email-alain.volmat@foss.st.com>
 <1616075089-28115-2-git-send-email-alain.volmat@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1616075089-28115-2-git-send-email-alain.volmat@foss.st.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Mar 18, 2021 at 02:44:48PM +0100, Alain Volmat wrote:
> Based on the SMBus specification, SMBus Alert active state is low.
> As often on SoC, the SMBus Alert pin is not only dedicated to this
> feature and can also be used for another purpose (by configuring it
> as alternate function for other functions via pinctrl).
> 
> "smbus" dt-binding has been introduced recently [1], however it is also
> used to indicate usage of host-notify feature.
> Relying on 'smbus' binding for SMBus-Alert as well as it was discussed
> previously [2] would lead to requiring the SMBALERT# pin to be configured
> as alternate function for i2c/smbus controller even if only host-notify is
> needed.
> Indeed, not doing so would lead to spurious SMBus Alert interrupts since
> the i2c/smbus controller would see the (not configured) SMBA pin as low
> level.
> 
> For that reason, SMBus-Alert needs to have its own binding in order
> to only be enabled whenever SMBALERT# pin is configured as alternate
> function for i2c/smbus controller.
> 
> [1] https://marc.info/?l=linux-i2c&m=159531254413805&w=2
> [2] https://marc.info/?l=linux-renesas-soc&m=159361426409817&w=2

Please use lore.kernel.org links.

> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> 
> ---
> v2: introduce st,smbus-alert property
> ---
>  Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml | 5 +++++
>  1 file changed, 5 insertions(+)

With that,

Reviewed-by: Rob Herring <robh@kernel.org>

Though I defer to Wolfram whether this could/should be common instead.

Rob
