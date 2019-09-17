Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0195AB5059
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Sep 2019 16:28:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727948AbfIQO2L (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Sep 2019 10:28:11 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:39479 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725922AbfIQO2K (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 Sep 2019 10:28:10 -0400
Received: by mail-ot1-f66.google.com with SMTP id s22so3223537otr.6;
        Tue, 17 Sep 2019 07:28:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dq5KSLPgssnZJkXSQ/7XfJ9L3JyQqyDlXS5uQBl4Tyc=;
        b=qADoi4KGGeekjNr8hgtMqgYOoGHzwHJMzF8P1jd9dsBt1oLQ7HOzkKpIEUuA87zrCW
         N1VCK1XSwboXXHV02Rg02OeleieoFWqonHWWEOWjPQPCm8gYKvUm5UXhvjm3n2itd+23
         3DmnTlOvPoNMakBBClXsAk4snphNRDJaRQyR6GXzRWV3c6pkM26iorxB7JB2t19Vx64D
         2R1bf6kR2X/m8fGy2JSgfDNOkjVu4MX87L0LqLLCB4KvGLCfZ5pzia5MZ5mTSr9Y3pY2
         2DLIhI3PLjanV8cnzaAiPzx5niP6kSHhAfJtdTsAO3xEswgrYfVz0mtzof7JJzD7KXLq
         DZxg==
X-Gm-Message-State: APjAAAX0TyZ/nLmePMje8wYp4uNilREpVw8CKZSRHaCBMhgjN23te30O
        VlCkDPRwgZE8JU6sNoB13qlCKMY=
X-Google-Smtp-Source: APXvYqyKeVBb7FDox3duyXtElvoxiAR3ydGskKPrIwTLgPjUgRPdZc4Aekd8EIPkn7mTC8YkHehpsQ==
X-Received: by 2002:a9d:7b4d:: with SMTP id f13mr2740477oto.365.1568730489731;
        Tue, 17 Sep 2019 07:28:09 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 94sm718166oty.44.2019.09.17.07.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2019 07:28:08 -0700 (PDT)
Date:   Tue, 17 Sep 2019 09:28:08 -0500
From:   Rob Herring <robh@kernel.org>
To:     Eugen.Hristev@microchip.com
Cc:     wsa@the-dreams.de, peda@axentia.se, mark.rutland@arm.com,
        Ludovic.Desroches@microchip.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, alexandre.belloni@bootlin.com,
        Nicolas.Ferre@microchip.com
Subject: Re: [PATCH v5 2/9] dt-bindings: i2c: add bindings for i2c analog and
 digital filter
Message-ID: <20190917142808.GA7900@bogus>
References: <1568189911-31641-1-git-send-email-eugen.hristev@microchip.com>
 <1568189911-31641-3-git-send-email-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1568189911-31641-3-git-send-email-eugen.hristev@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Sep 11, 2019 at 08:24:20AM +0000, Eugen.Hristev@microchip.com wrote:
> From: Eugen Hristev <eugen.hristev@microchip.com>
> 
> Some i2c controllers have a built-in digital or analog filter.
> This is specifically required depending on the hardware PCB/board.
> Some controllers also allow specifying the maximum width of the
> spikes that can be filtered for digital filter. The width length can be
> specified in nanoseconds.
> Analog filters can be configured to have a cutoff frequency (low-pass filter).
> This frequency can be specified in Hz.
> Added an optional property for such types of analog filters.
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c.txt | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
