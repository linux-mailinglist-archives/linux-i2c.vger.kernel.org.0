Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F69F150616
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Feb 2020 13:24:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727970AbgBCMX5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Feb 2020 07:23:57 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:36879 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727907AbgBCMX5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 3 Feb 2020 07:23:57 -0500
Received: by mail-wr1-f65.google.com with SMTP id w15so17831113wru.4;
        Mon, 03 Feb 2020 04:23:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3v/Vs0yeJ3ecKwEer6nb6dCD848+syrgOhZ1MgNf01o=;
        b=fqKSl7X0LutSAY99vuoVKB6cxiwFTzr1G1eDlVI4oxgGt1QDruCijmCtNXclpwOHuZ
         QZYJX0eD5KbnjcYZ+GKYovEqcwIJHduocWVnh5DQLcRSMrEgBx08vGgevNZiHExlkfQg
         ffp+pNGtx0xx2HKY+Cs8TCU/9xjNnFlRe1vJZCGGAWl/OJgEyjTazaK5LVQiffqf0e1N
         1CwIF57bt2Pmi4WFSRwapdwYDQRi4+t5c2WbdlZsiSBG7WI9GEmHds24MBZkLVGBFxRx
         jbJeQDCEpgL/s0lv8L6Mdy78gOp7vFBvxoIF1RWQCDAkz8qdbxUIlJ/r+EEqgKr4VIUT
         Dr/w==
X-Gm-Message-State: APjAAAXVskE183SbV+q8jt3k3TBc35xpZx8hhIdBOX7Xna64Z3X5atey
        Sb157QCu/40FF2/dYqEbvQ==
X-Google-Smtp-Source: APXvYqzm7oTIsPC2zqv1FVF4iP/x1vKYv6xy17lG21/YsbaWyAoqw9qpdPt25TTkhLOPw4zWj+CrZQ==
X-Received: by 2002:a5d:620b:: with SMTP id y11mr15162486wru.230.1580732635248;
        Mon, 03 Feb 2020 04:23:55 -0800 (PST)
Received: from rob-hp-laptop ([212.187.182.163])
        by smtp.gmail.com with ESMTPSA id n1sm25145622wrw.52.2020.02.03.04.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2020 04:23:54 -0800 (PST)
Received: (nullmailer pid 26802 invoked by uid 1000);
        Mon, 03 Feb 2020 12:23:52 -0000
Date:   Mon, 3 Feb 2020 12:23:52 +0000
From:   Rob Herring <robh@kernel.org>
To:     Alain Volmat <alain.volmat@st.com>
Cc:     wsa@the-dreams.de, robh+dt@kernel.org, mark.rutland@arm.com,
        pierre-yves.mordret@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        fabrice.gasnier@st.com, alain.volmat@st.com
Subject: Re: [PATCH 2/5] dt-bindings: i2c: i2c-stm32f7: add st,stm32mp15-i2c
 compatible
Message-ID: <20200203122352.GA26745@bogus>
References: <1579795970-22319-1-git-send-email-alain.volmat@st.com>
 <1579795970-22319-3-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1579795970-22319-3-git-send-email-alain.volmat@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 23 Jan 2020 17:12:47 +0100, Alain Volmat wrote:
> Add a new stm32mp15 specific compatible to handle FastMode+
> registers which are different on the stm32mp15 compared
> to the stm32f7 or stm32h7.
> 
> Signed-off-by: Alain Volmat <alain.volmat@st.com>
> ---
>  Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
