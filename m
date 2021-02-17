Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F076E31D6AA
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Feb 2021 09:36:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231694AbhBQIgF convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Wed, 17 Feb 2021 03:36:05 -0500
Received: from mail-ej1-f54.google.com ([209.85.218.54]:35645 "EHLO
        mail-ej1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231462AbhBQIgA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 17 Feb 2021 03:36:00 -0500
Received: by mail-ej1-f54.google.com with SMTP id g5so17262357ejt.2;
        Wed, 17 Feb 2021 00:35:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=9YGc/AkEmrmvh3rYxNMRJNk+zbFkuGcoCi3dyG2K5wQ=;
        b=fCBpYFZkw5kLxtcWF5IASW7xHhj0vcaKXpEvmfY0OexfmP371keiGquObRyOYb2xwA
         aZLn8bdlx3+BshYb5P0QAzVLNPkm4sva0rPBtDGCD5IMJl2jbiggtLfNMiNuJZzV+dVR
         APP5UR9W6wk5OFtoHftWLQkgKAdA1hMUJPg4ghFXVkAZJVBWS7VhkhEY+rszAg82+HJB
         P3j2bumbRQQe8iKO+vVmT+a1ZB7NQ8Br/PAIOnG5/Cmoghnod6z3J4qejjQBNUOiYNbl
         oyY/FL0jDk1VHBwDYHkIL73/wyJbVa1yMocFsj6R9ivBh2ZvLajEl3Q2fl03MEO8bzke
         9mNw==
X-Gm-Message-State: AOAM533pdqRd87Ae4j6JLkkjVyD5dPS0zFQFnJOBSGqwCODNm33yBzNh
        aGghGdRhjrxl20HvfKMe6YU=
X-Google-Smtp-Source: ABdhPJwEw9XICl6WlTWbG6n9gcJnfoCj4IdJREq+D8UV1QLDJQaZ1WW/n3Uv9WVjsIlSArdj3d1avA==
X-Received: by 2002:a17:907:9483:: with SMTP id dm3mr24482144ejc.120.1613550917882;
        Wed, 17 Feb 2021 00:35:17 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id z2sm649259ejd.44.2021.02.17.00.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 00:35:16 -0800 (PST)
Date:   Wed, 17 Feb 2021 09:35:15 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     =?utf-8?Q?M=C3=A5rten?= Lindahl <marten.lindahl@axis.com>
Cc:     kernel@axis.com,
        =?utf-8?Q?M=C3=A5rten?= Lindahl <martenli@axis.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: exynos5: Preserve high speed master code
Message-ID: <20210217083515.n5mgzgsddsks4aaw@kozik-lap>
References: <20210216222538.6427-1-marten.lindahl@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20210216222538.6427-1-marten.lindahl@axis.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Feb 16, 2021 at 11:25:38PM +0100, Mårten Lindahl wrote:
> From: Mårten Lindahl <martenli@axis.com>
> 
> When the driver starts to send a message with the MASTER_ID field
> set (high speed), the whole I2C_ADDR register is overwritten including
> MASTER_ID as the SLV_ADDR_MAS field is set.
> 
> This patch preserves already written fields in I2C_ADDR when writing
> SLV_ADDR_MAS.
> 
> Signed-off-by: Mårten Lindahl <martenli@axis.com>
> ---
> v2:
> - Change commit message as the problem is not in the controller but in
>   the driver.
> - Use MASTER_ID macro instead of reading back register contents.
> 
>  drivers/i2c/busses/i2c-exynos5.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Tested-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
