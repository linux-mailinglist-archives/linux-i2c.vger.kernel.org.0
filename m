Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CE51EE5A8
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Nov 2019 18:16:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728064AbfKDRQr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 4 Nov 2019 12:16:47 -0500
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:51523 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727989AbfKDRQr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 4 Nov 2019 12:16:47 -0500
Received: from [109.168.11.45] (port=55668 helo=[192.168.101.73])
        by hostingweb31.netsons.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <luca@lucaceresoli.net>)
        id 1iRfy8-007lIY-J6; Mon, 04 Nov 2019 18:16:44 +0100
Subject: Re: [PATCH] i2c: xiic: Fix kerneldoc warnings
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        linux-i2c@vger.kernel.org
Cc:     michal.simek@xilinx.com
References: <1572615563-31751-1-git-send-email-shubhrajyoti.datta@xilinx.com>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <f0a66b3c-17a1-8fb0-ee89-1dc8d0668d8c@lucaceresoli.net>
Date:   Mon, 4 Nov 2019 18:16:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1572615563-31751-1-git-send-email-shubhrajyoti.datta@xilinx.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca+lucaceresoli.net/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Shubhrajyoti,

On 01/11/19 14:39, Shubhrajyoti Datta wrote:
> Fix the below warning by adding the description of clock and dev.
> 
> drivers/i2c/busses/i2c-xiic.c:57: info: Scanning doc for struct xiic_i2c
> drivers/i2c/busses/i2c-xiic.c:84: warning: Function parameter or member
> 'dev' not described in 'xiic_i2c'
> drivers/i2c/busses/i2c-xiic.c:84: warning: Function parameter or member
> 'clk' not described in 'xiic_i2c'
> 
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> ---
>  drivers/i2c/busses/i2c-xiic.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
> index 0c51c0f..e212a9c 100644
> --- a/drivers/i2c/busses/i2c-xiic.c
> +++ b/drivers/i2c/busses/i2c-xiic.c
> @@ -55,6 +55,7 @@ enum xiic_endian {
> 
>  /**
>   * struct xiic_i2c - Internal representation of the XIIC I2C bus
> + * @dev:       Pointer to device structure
>   * @base:      Memory base of the HW registers
>   * @wait:      Wait queue for callers
>   * @adap:      Kernel adapter representation
> @@ -66,6 +67,7 @@ enum xiic_endian {
>   * @rx_msg:    Current RX message
>   * @rx_pos:    Position within current RX message
>   * @endianness: big/little-endian byte order
> + * @clk:       Pointer to struct clk

'Pointer to struct clk' does not say anything that is not already
obvious from the 'struct clk *clk' below. I understand you are simply
fixing a kernel-doc warning, but I'd rather document this field as
'Input clock' or 'AXI4-Lite input clock', which gives at least a bit of
extra information (even though not much more, because clock management
is really simple for this device).

Just my 2c,
-- 
Luca
