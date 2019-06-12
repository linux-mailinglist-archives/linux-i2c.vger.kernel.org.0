Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B1DA4281C
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jun 2019 15:55:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408762AbfFLNza (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 Jun 2019 09:55:30 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:35730 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407368AbfFLNza (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 12 Jun 2019 09:55:30 -0400
Received: by mail-wr1-f68.google.com with SMTP id m3so17064143wrv.2;
        Wed, 12 Jun 2019 06:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=eZX3anyZMMAgTvTOAbA6GQo46jqojN0EiJPMmbv67bA=;
        b=JXE5QOKTWFbr6BQ6o8PjdWiflFieSzJ6ofNQwYduozexkoEMzTSrQiqW/WX/PoweCS
         1JHqfWuLCQPWbjxM7j/IEGK8G3aFHQbXs2ETn3fbjYb2iZc3IYZuwMatIW4jOoZXrrcJ
         Ep7sQzS6MyKKLHm6SSESA2PNYz1M1G2DbJ1Ws0OqQl46zKasVNBxemDAyR0OssSjWyo4
         AVx1/z4GTPaC1YxzNZ/EHA8NfwxuD3nEO7m8kE4h0OAruSReCP6cf8LSvfR9g933kbWp
         38G3wdqmlw/wB8sOdYU6a1K/vDcBi2LxDphJusEJMjhHwe6COutExhMCnfqk7BbCURMu
         UxKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=eZX3anyZMMAgTvTOAbA6GQo46jqojN0EiJPMmbv67bA=;
        b=SmU1fJTSKKHJlbvnN0m5fjoOv/BlidrSXQKE7Zz2auK7aMITl3UwzAVFdlC7mwcw3A
         yD90N+xPzPOneu/r18Shsc6VyWqWHcOY9xrw4oxcUxK6ccBIbS+k81+nEurS+MsootSW
         UeymnxPcJHy1ljTfSXIgDKH0+3sAk6eO+fOrDd52KVB5KlYCbZYO3Drud3ku+JYcWKNF
         zQ0njeO+U6smUs0uPWcrwFGTSIATzEWymrJ+82sMMKO82ObxH1hUnbGhywjmQp6l53hu
         cb3FwQVy05u5mhBdi3Bhr9HCamwtgMDg9bViJGpbZ5A9ePWQq4Oy4MIltEHGRQyTgZO3
         59gw==
X-Gm-Message-State: APjAAAUBS3CxIorLgl9Nw7zJyGeiwim/NQbW26FT2DAOyYN0dJESIvVP
        bydK9EuQU+ah1m35IXJMs3E=
X-Google-Smtp-Source: APXvYqwjyH5JmEcfzRpESprQR/QtSXTMaNRLBZytNj2AXDHNhT6aiWI7ZMCrVWWviowXrniWslUoeA==
X-Received: by 2002:adf:e34e:: with SMTP id n14mr35430946wrj.169.1560347728053;
        Wed, 12 Jun 2019 06:55:28 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-79-162-197.pppoe.mtu-net.ru. [91.79.162.197])
        by smtp.googlemail.com with ESMTPSA id v18sm17973839wrs.80.2019.06.12.06.55.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Jun 2019 06:55:26 -0700 (PDT)
Subject: Re: [PATCH V5 6/7] i2c: tegra: fix PIO rx/tx residual transfer check
To:     Bitan Biswas <bbiswas@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     Shardar Mohammed <smohammed@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Mantravadi Karthik <mkarthik@nvidia.com>
References: <1560250274-18499-1-git-send-email-bbiswas@nvidia.com>
 <1560250274-18499-6-git-send-email-bbiswas@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <b6b24358-36a0-af98-1b29-9a622baa9600@gmail.com>
Date:   Wed, 12 Jun 2019 16:55:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1560250274-18499-6-git-send-email-bbiswas@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

11.06.2019 13:51, Bitan Biswas пишет:
> Fix expression for residual bytes(less than word) transfer
> in I2C PIO mode RX/TX.
> 
> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index 4dfb4c1..0596c12 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -514,7 +514,8 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
>  	 * If there is a partial word at the end of buf, handle it manually to
>  	 * prevent overwriting past the end of buf
>  	 */
> -	if (rx_fifo_avail > 0 && buf_remaining > 0) {
> +	if (rx_fifo_avail > 0 &&
> +	    (buf_remaining > 0 && buf_remaining < BYTES_PER_FIFO_WORD)) {

The buf_remaining >= BYTES_PER_FIFO_WORD is not possible to happen
because there are three possible cases:

1) buf_remaining > rx_fifo_avail * 4:

	In this case rx_fifo_avail = 0

2) buf_remaining < rx_fifo_avail * 4;

	In this case buf_remaining is always < 4 because
	words_to_transfer is a buf_remaining rounded down to 4
	and then divided by 4. Hence:

	buf_remaining -= (buf_remaining / 4) * 4 always results
	into buf_remaining < 4.

3) buf_remaining == rx_fifo_avail * 4:

	In this case rx_fifo_avail = 0 and buf_remaining = 0.

Case 2 should never happen and means that something gone wrong.

>  		BUG_ON(buf_remaining > 3);
>  		val = i2c_readl(i2c_dev, I2C_RX_FIFO);
>  		val = cpu_to_le32(val);
> @@ -557,11 +558,10 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_dev *i2c_dev)
>  			words_to_transfer = tx_fifo_avail;
>  
>  		/*
> -		 * Update state before writing to FIFO.  If this casues us
> +		 * Update state before writing to FIFO.  If this causes us
>  		 * to finish writing all bytes (AKA buf_remaining goes to 0) we
>  		 * have a potential for an interrupt (PACKET_XFER_COMPLETE is
> -		 * not maskable).  We need to make sure that the isr sees
> -		 * buf_remaining as 0 and doesn't call us back re-entrantly.
> +		 * not maskable).
>  		 */
>  		buf_remaining -= words_to_transfer * BYTES_PER_FIFO_WORD;
>  		tx_fifo_avail -= words_to_transfer;
> @@ -580,7 +580,8 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_dev *i2c_dev)
>  	 * prevent reading past the end of buf, which could cross a page
>  	 * boundary and fault.
>  	 */
> -	if (tx_fifo_avail > 0 && buf_remaining > 0) {
> +	if (tx_fifo_avail > 0 &&
> +	    (buf_remaining > 0 && buf_remaining < BYTES_PER_FIFO_WORD)) {
>  		BUG_ON(buf_remaining > 3);
>  		memcpy(&val, buf, buf_remaining);
>  		val = le32_to_cpu(val);
> 

Same as for RX.
