Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAE2E29889C
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Oct 2020 09:40:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1769514AbgJZIki (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 26 Oct 2020 04:40:38 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:42736 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1746866AbgJZIki (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 26 Oct 2020 04:40:38 -0400
Received: by mail-ed1-f68.google.com with SMTP id v19so8382237edx.9;
        Mon, 26 Oct 2020 01:40:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fPY3YUMaHx0SYLGgmZyNAyMNlSCq8nr0Au+mUxZwASo=;
        b=V35cQF6bQXl6Tjm1KvJ2BH2QIJJxZWHCJcbPlvTlqsVrHGibEDS5Ay+8/qd7CSXMxX
         aDa8Sfs7s96wBPMYgUCF6ZtuAYnxOIIMPjGIP7BtNKp0L6l74y6VLN3gC+IJozh3XZLb
         L+UEnv8rJDdp05l5y2GwT6XxWCYDBnpsl1l1FherPwWGAa9IJqqVxkjbYNDBlXn/OgXR
         e9VoF7dFba3gfToAdc4BO2gtmRUZ7rLZGd1nupaHDmFEYYgGPjzZwIp5ywwYHh0donDj
         5mvWFgr8SZl8h7aA0xtHhwbglLdh/yxeU3OInwpMCjXgpZ5N5YukfbtSJlfikvt3ijhZ
         QbAw==
X-Gm-Message-State: AOAM531bWDXia5tRD3uKOL8jPeHe/fXvnI3vswP8NpdSYRETlGFvFatf
        GTbT5w1z2GDRmsunG+u+dC4zVayPe3w=
X-Google-Smtp-Source: ABdhPJzMNFAPm/G/FPe2T5GfoWx+hZWCWuIsNulsXqm9QWpIwDSzI0aXCpKKCmaS2zzfu6KxDgxn0A==
X-Received: by 2002:a50:8f61:: with SMTP id 88mr14969192edy.175.1603701634845;
        Mon, 26 Oct 2020 01:40:34 -0700 (PDT)
Received: from kozik-lap ([194.230.155.184])
        by smtp.googlemail.com with ESMTPSA id u10sm5306057ejh.54.2020.10.26.01.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 01:40:33 -0700 (PDT)
Date:   Mon, 26 Oct 2020 09:40:31 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-pm@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-serial@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: More whitespace clean-ups in schema files
Message-ID: <20201026084031.GA7466@kozik-lap>
References: <20201023192258.3126047-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201023192258.3126047-1-robh@kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Oct 23, 2020 at 02:22:58PM -0500, Rob Herring wrote:
> Clean-up incorrect indentation, extra spaces, and missing EOF newline in
> schema files. Most of the clean-ups are for list indentation which
> should always be 2 spaces more than the preceding keyword.
> 
> Found with yamllint (now integrated into the checks).
> 
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-i2c@vger.kernel.org
> Cc: linux-iio@vger.kernel.org
> Cc: linux-pm@vger.kernel.org
> Cc: alsa-devel@alsa-project.org
> Cc: linux-mmc@vger.kernel.org
> Cc: linux-mtd@lists.infradead.org
> Cc: linux-serial@vger.kernel.org
> Cc: linux-usb@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
