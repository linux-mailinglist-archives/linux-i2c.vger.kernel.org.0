Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E059A9C8D
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2019 10:04:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732247AbfIEIEs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Sep 2019 04:04:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:59246 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730991AbfIEIEs (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 5 Sep 2019 04:04:48 -0400
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 530EC21883;
        Thu,  5 Sep 2019 08:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567670687;
        bh=UUzJc/ue/a93m0taKXh9s1z/mAnBDooHV9BAX4YRpa0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=xdyxIzcFkmCittJxVLCAnOnnNhEdIUpg/9yWl0O8cay9hW9RCuNO+ISs7scEl9jVk
         ru+HwIovSaqbuZk3eEXbNoszctpB8zApTb0PQjkd2C96SHmLTTekEzAXWVju7W+1ce
         NjGmlHRyndymkkjkSrGLKn1qNFr0yjql+TV/MZOY=
Received: by mail-qt1-f173.google.com with SMTP id b2so1746723qtq.5;
        Thu, 05 Sep 2019 01:04:47 -0700 (PDT)
X-Gm-Message-State: APjAAAVrex28OBhtUOoDe8akGnLPkVKoRf4diZ0PX3zvSlg/GuLF9tNA
        fxUX1OVGPF9TaYkSekdA6eGakfkpzUkRKBEUng==
X-Google-Smtp-Source: APXvYqwRGN/t8Ztwm+Pr581GXO5zsaWfW8VanIvwMI00vkFHJS2e6Kk1OJsW7UmmPizjTTPidsBQ1AWG7fsG3JHH9Ls=
X-Received: by 2002:ac8:31b3:: with SMTP id h48mr2280163qte.300.1567670686489;
 Thu, 05 Sep 2019 01:04:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190905075213.13260-1-lee.jones@linaro.org>
In-Reply-To: <20190905075213.13260-1-lee.jones@linaro.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Thu, 5 Sep 2019 09:04:34 +0100
X-Gmail-Original-Message-ID: <CAL_JsqKB1hyJKM6S9cbNptq9kysa4_mgxaby7WmQHMW6d8KX3w@mail.gmail.com>
Message-ID: <CAL_JsqKB1hyJKM6S9cbNptq9kysa4_mgxaby7WmQHMW6d8KX3w@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: soc: qcom: Provide option to disable DMA
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Alok Chauhan <alokc@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        devicetree@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>,
        Vinod <vkoul@kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Sep 5, 2019 at 8:52 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> Used when DMA is not available or the best option.
>
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> Reviewed-by: Vinod Koul <vkoul@kernel.org>
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.txt | 1 +
>  1 file changed, 1 insertion(+)

If it was me, I'd just turn off DMA. DMA for typical I2C usage seems
kind of pointless. However:

Acked-by: Rob Herring <robh@kernel.org>
