Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E00C01E3C80
	for <lists+linux-i2c@lfdr.de>; Wed, 27 May 2020 10:47:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388279AbgE0Iqw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 May 2020 04:46:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:48430 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388107AbgE0Iqw (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 27 May 2020 04:46:52 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 29FBB206F1;
        Wed, 27 May 2020 08:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590569211;
        bh=2P/iFP0J1Z8FTALnk4pEhSuziKCtu7sPf7Qz1B/J4f8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=S9BG8lqat+vffXT8uHIaTo94/pT6Z83+gHIjB1CBWUaRi+h21fNoDoFRR4xE5PBc9
         IvPYTYD4kc8d/QbLsMEmVL9PcVZjrgS3p16wEXmSq/Q853iDNJA96icvD82d+xMnq3
         lRMjEASAU6ka38Qb+0SPKq4FwaptSUdFriCigzcE=
Date:   Wed, 27 May 2020 10:46:49 +0200
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
Subject: Re: [PATCH V7 5/7] tty: serial: qcom_geni_serial: Add interconnect
 support
Message-ID: <20200527084649.GA167630@kroah.com>
References: <1590497690-29035-1-git-send-email-akashast@codeaurora.org>
 <1590497690-29035-6-git-send-email-akashast@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1590497690-29035-6-git-send-email-akashast@codeaurora.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, May 26, 2020 at 06:24:48PM +0530, Akash Asthana wrote:
> Get the interconnect paths for Uart based Serial Engine device
> and vote according to the baud rate requirement of the driver.
> 
> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
