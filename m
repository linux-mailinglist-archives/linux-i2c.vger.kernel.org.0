Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 267491DC8DA
	for <lists+linux-i2c@lfdr.de>; Thu, 21 May 2020 10:40:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728680AbgEUIkB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 21 May 2020 04:40:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:41510 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728374AbgEUIkA (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 21 May 2020 04:40:00 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C40E920721;
        Thu, 21 May 2020 08:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590050400;
        bh=zk5OdGcGOSwlO1xBOqMZeDZ1i6Bi0Kg8cXiAy5qbVSQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZFIn5xGzV0MFkFcNMpXZ5CpTl0GFLnU6FLCyPhqtTNYH7nnoe4DPgvtUlmgw8xvTE
         YggEuXz7qtmf2IwrtipWFW1ZfKJItLHFgIwDnyAoI5esYTzfr+Afmp4WtpN290AKBh
         MG/ilOEHbYgXkuNpBKjrXMuUpLDq5zCCPNlKfdcs=
Date:   Thu, 21 May 2020 10:39:58 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Akash Asthana <akashast@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, wsa@the-dreams.de,
        broonie@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, swboyd@chromium.org,
        mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, mka@chromium.org,
        dianders@chromium.org, msavaliy@codeaurora.org,
        evgreen@chromium.org
Subject: Re: [PATCH V6 5/7] tty: serial: qcom_geni_serial: Add interconnect
 support
Message-ID: <20200521083958.GA2689021@kroah.com>
References: <1590049764-20912-1-git-send-email-akashast@codeaurora.org>
 <1590049764-20912-6-git-send-email-akashast@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1590049764-20912-6-git-send-email-akashast@codeaurora.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, May 21, 2020 at 01:59:22PM +0530, Akash Asthana wrote:
> Get the interconnect paths for Uart based Serial Engine device
> and vote according to the baud rate requirement of the driver.
> 
> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> ---
> Changes in V2:
>  - As per Bjorn's comment, removed se == NULL check from geni_serial_icc_get
>  - As per Bjorn's comment, removed code to set se->icc_path* to NULL in failure
>  - As per Bjorn's comment, introduced and using devm_of_icc_get API for getting
>    path handle
>  - As per Matthias comment, added error handling for icc_set_bw call
> 
> Changes in V3:
>  - As per Matthias comment, use common library APIs defined in geni-se
>    driver for ICC functionality.
> 
> Changes in V4:
>  - As per Mark's comment move peak_bw guess as twice of avg_bw if
>    nothing mentioned explicitly to ICC core.
>  - As per Matthias's comment select core clock BW based on baud rate.
>    If it's less than 115200 go for GENI_DEFAULT_BW else CORE_2X_50_MHZ
> 
> Changes in V5:
>  - Add icc_enable/disable to power on/off call.
>  - Save some non-zero avg/peak value to ICC core by calling geni_icc_set_bw
>    from probe so that when resume/icc_enable is called NOC are running at
>    some non-zero value. No need to call icc_disable after BW vote because
>    console devices are expected to be in active state from the probe itself
>    and qcom_geni_serial_pm(STATE_OFF) will be called for non-console ones.
> 
> Changes in V6:
>  - No change
> 
>  drivers/tty/serial/qcom_geni_serial.c | 31 ++++++++++++++++++++++++++++---
>  1 file changed, 28 insertions(+), 3 deletions(-)

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
