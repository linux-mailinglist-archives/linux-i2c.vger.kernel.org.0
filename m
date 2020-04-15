Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABC2E1A96E2
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Apr 2020 10:39:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2894681AbgDOIiS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Apr 2020 04:38:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2894680AbgDOIiJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Apr 2020 04:38:09 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9696C061A0C;
        Wed, 15 Apr 2020 01:38:08 -0700 (PDT)
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 81BBB2D1;
        Wed, 15 Apr 2020 10:38:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586939887;
        bh=m17M/qxOXVGsFQJ698T1Ff8MtF5x26XIRLZsnobAhNg=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=YJHXYax3vn++WTEV3ZgsaAvu0Np/2TLyVoFAzk/SXaOkJgHeaTy+3qpw2qOZurZqX
         6IVPyXrZX9N8VJqLF0Mc5OTr6mZORtiKu6Q4+vFNM2DQJECPvFLsBVNmlTJrv7BPPL
         8UlYHHVmPO7J16i7Sm3gN5xiQO6qWFL3jtZ8+DsE=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [RFC PATCH v2 2/6] i2c: allow DT nodes without 'compatible'
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Luca Ceresoli <luca@lucaceresoli.net>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-i3c@lists.infradead.org,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh@kernel.org>
References: <20200318150059.21714-1-wsa+renesas@sang-engineering.com>
 <20200318150059.21714-3-wsa+renesas@sang-engineering.com>
 <11ca7487-ac07-f714-8573-20d1a0040212@lucaceresoli.net>
 <20200415075911.GA1141@ninjato>
 <8937e466-fe3f-3686-98a9-8013990bc3f9@ideasonboard.com>
 <20200415081654.GC1141@ninjato>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <dd627250-7916-8ac6-9a3c-316e0d7843ae@ideasonboard.com>
Date:   Wed, 15 Apr 2020 09:38:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200415081654.GC1141@ninjato>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On 15/04/2020 09:16, Wolfram Sang wrote:
> 
>> Aha, is it easy enough to distinguish that difference in user-space so
>> that we can present a specific character to indicate this in i2cdetect?
>> Or is that not so easy?
> 
> I thought about it shortly but have not come up with a way of doing
> that. This is the code in i2cdetect:
> 
> 	/* Set slave address */
> 	if (ioctl(file, I2C_SLAVE, i+j) < 0) {
> 		if (errno == EBUSY) {
> 			printf("UU ");
> 			continue;
> 		} else {
> 			fprintf(stderr, "Error: Could not set "
> 				"address to 0x%02x: %s\n", i+j,
> 				strerror(errno));
> 			return -1;
> 		}
> 	}
> 
> So, if we chose to use another errno to indicate 'reserved' and update
> i2cdetect, all old versions of i2cdetect will have ugly error messages.
> And adding another IOCTL just for printing reserved addresses neither
> sounds great.

Indeed, a different errno would be about all we could do - and it would
seemingly leave old i2cdetects with complete failures, if it goes
through that non-EBUSY code path.

Ayeeeee :-S

--
Kieran

