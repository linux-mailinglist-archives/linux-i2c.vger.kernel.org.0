Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 363326DF5E4
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Apr 2023 14:45:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229634AbjDLMpB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 Apr 2023 08:45:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231689AbjDLMon (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 12 Apr 2023 08:44:43 -0400
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B8D27ED2;
        Wed, 12 Apr 2023 05:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=+78AZRYU7aeTnVMroAv5PpTTk3mZ2oSOoWxG6khQdOE=; b=1NMXD4c4+ttuVMXf2h9bkPusSZ
        fZsm8Wf6r+KhLPcDp6H2rJYpSOsQCLXlk6MJA9ruQ9DbzTiTQDYkZCnpyJ/7Y5RULgw4zRBiceyi4
        q292iJU6vPniDvADrBQAiUAgJST7DlAgFRZREaYeZh1fr/wqGqf+kTBG76D87NBQASS4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1pmZpH-00A5Zg-3m; Wed, 12 Apr 2023 14:43:51 +0200
Date:   Wed, 12 Apr 2023 14:43:51 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc:     Peter Korsgaard <peter@korsgaard.com>,
        Federico Vaga <federico.vaga@cern.ch>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux@ew.tq-group.com
Subject: Re: [PATCH] i2c: ocores: generate stop condition after timeout in
 polling mode
Message-ID: <a1e701cc-aa4f-4098-95c9-0cb7aaf5b281@lunn.ch>
References: <20230220161628.463620-1-matthias.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230220161628.463620-1-matthias.schiffer@ew.tq-group.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Matthias

I also don't have access to the hardware, but the change looks O.K.

>  static int ocores_xfer_core(struct ocores_i2c *i2c,
> @@ -387,16 +389,16 @@ static int ocores_xfer_core(struct ocores_i2c *i2c,
>  	oc_setreg(i2c, OCI2C_DATA, i2c_8bit_addr_from_msg(i2c->msg));
>  	oc_setreg(i2c, OCI2C_CMD, OCI2C_CMD_START);
>  
> -	if (polling) {
> -		ocores_process_polling(i2c);
> -	} else {
> +	if (polling)
> +		ret = ocores_process_polling(i2c);
> +	else
>  		ret = wait_event_timeout(i2c->wait,
>  					 (i2c->state == STATE_ERROR) ||
> -					 (i2c->state == STATE_DONE), HZ);
> -		if (ret == 0) {
> -			ocores_process_timeout(i2c);
> -			return -ETIMEDOUT;
> -		}
> +					 (i2c->state == STATE_DONE), HZ) ?
> +						0 : -ETIMEDOUT;
> +	if (ret) {
> +		ocores_process_timeout(i2c);
> +		return ret;
>  	}

The ret == 0 becoming ret is not so obvious. Rather than having the
trinary, do

		if (ret == 0)
		   ret = -ETIMEDOUT;

and then fall into your new if clause. I think that makes it more
obvious that wait_event_timeout() returns 0 on timeout.

	Andrew
