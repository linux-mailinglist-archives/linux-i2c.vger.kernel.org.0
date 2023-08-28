Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C589478B50C
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Aug 2023 18:04:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229646AbjH1QDh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 28 Aug 2023 12:03:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231720AbjH1QDZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 28 Aug 2023 12:03:25 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B3D3123
        for <linux-i2c@vger.kernel.org>; Mon, 28 Aug 2023 09:03:22 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1bc8a2f71eeso18974165ad.0
        for <linux-i2c@vger.kernel.org>; Mon, 28 Aug 2023 09:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1693238602; x=1693843402;
        h=in-reply-to:from:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7oCBnc/+9GT2iNKumYAJajb/iJOTkgjrMnRQtvYJ7Qk=;
        b=fm0RuxlCAnKaNI1eV30/yJ3UPY8siE2pPQQdrTKUHuaCeX9Fh8SK9epLsjcDmcYnKq
         VPcdUzfIZkJqO/i9qFdrO9Uk9rmO24ubSke1i20n2OBMlc5bw4AZ2DgGkB9EvE9yQItp
         ca4/RH1KFg8LkKobecGhSASos8fthaRN6W7BE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693238602; x=1693843402;
        h=in-reply-to:from:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7oCBnc/+9GT2iNKumYAJajb/iJOTkgjrMnRQtvYJ7Qk=;
        b=kB7q0Hlp4FIbFV0BgPy0e4Tk/1UtRo8417Ig3IDdJY1T02OE8af0F+GFyl6zwtI0KZ
         p89UGOZGSXxZT+uSihcR27SEktZzQ/tE4iHX5ugs1oUh3DvcX9JeNn6bPmV06B7BIQNV
         IdkumwevUlU1CsuJ8PaIfHM5YyCeqlc/7eys+Xfx1uVnBGKo+eeQWht8VPQJsEZr+Y02
         roPxRH90g+iNmH4QTT16qKuesxGZ3NfsdAg7HTpC6x2rfJmeKW68zYbbW1PUrAkmY2uP
         7Pwku9OQI361W62qc/IQ3SMbjuG+joZoZ1OewYPheefrSmrTPB4y6BjEEJngvy4s2hhJ
         vktw==
X-Gm-Message-State: AOJu0Yybx2DpIcPZG7HzAEZZNlt8R1nnB+r/HX8ruwC1t1t8LuszhXsu
        sjnETMnPMwIG3xb7p18Nu20FJQ==
X-Google-Smtp-Source: AGHT+IFL5AcH7kkxmS4kdNwL+iPvli/lde3NUVBhxIqaWQoSlRedMtzRLQLxTtjChvkqQLzPfWvoVA==
X-Received: by 2002:a17:903:2309:b0:1b9:f97a:16ab with SMTP id d9-20020a170903230900b001b9f97a16abmr23726235plh.57.1693238601933;
        Mon, 28 Aug 2023 09:03:21 -0700 (PDT)
Received: from [10.136.64.163] ([192.19.161.248])
        by smtp.gmail.com with ESMTPSA id jg3-20020a17090326c300b001bdc6ca748esm7549528plb.185.2023.08.28.09.03.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Aug 2023 09:03:20 -0700 (PDT)
Message-ID: <11fc8391-d3a6-a4c5-df23-fc2fca8f82b6@broadcom.com>
Date:   Mon, 28 Aug 2023 09:03:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] i2c: iproc: handle invalid slave state
To:     roman.bacik@broadcom.com, andi.shyti@kernel.org, rjui@broadcom.com,
        sbranden@broadcom.com
Cc:     bcm-kernel-feedback-list@broadcom.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230824212351.24346-1-roman.bacik@broadcom.com>
From:   Ray Jui <ray.jui@broadcom.com>
In-Reply-To: <20230824212351.24346-1-roman.bacik@broadcom.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
        boundary="0000000000006a64560603fdd594"
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

--0000000000006a64560603fdd594
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Roman,

On 8/24/2023 2:23 PM, roman.bacik@broadcom.com wrote:
> From: Roman Bacik <roman.bacik@broadcom.com>
> 
> Add the code to handle an invalid state when both bits S_RX_EVENT
> (indicating a transaction) and S_START_BUSY (indicating the end
> of transaction - transition of START_BUSY from 1 to 0) are set in
> the interrupt status register during a slave read.
> 
> Signed-off-by: Roman Bacik <roman.bacik@broadcom.com>
> Fixes: 1ca1b4516088 ("i2c: iproc: handle Master aborted error")
> ---
>  drivers/i2c/busses/i2c-bcm-iproc.c | 133 ++++++++++++++++-------------
>  1 file changed, 75 insertions(+), 58 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2c-bcm-iproc.c
> index 05c80680dff4..68438d4e5d73 100644
> --- a/drivers/i2c/busses/i2c-bcm-iproc.c
> +++ b/drivers/i2c/busses/i2c-bcm-iproc.c
> @@ -316,26 +316,44 @@ static void bcm_iproc_i2c_slave_init(
>  	iproc_i2c_wr_reg(iproc_i2c, IE_OFFSET, val);
>  }
>  
> -static void bcm_iproc_i2c_check_slave_status(
> -	struct bcm_iproc_i2c_dev *iproc_i2c)
> +static bool bcm_iproc_i2c_check_slave_status
> +	(struct bcm_iproc_i2c_dev *iproc_i2c, u32 status)
>  {
>  	u32 val;
> +	bool recover = false;
>  
> -	val = iproc_i2c_rd_reg(iproc_i2c, S_CMD_OFFSET);
> -	/* status is valid only when START_BUSY is cleared after it was set */
> -	if (val & BIT(S_CMD_START_BUSY_SHIFT))
> -		return;
> +	/* check slave transmit status only if slave is transmitting */
> +	if (!iproc_i2c->slave_rx_only) {
> +		val = iproc_i2c_rd_reg(iproc_i2c, S_CMD_OFFSET);
> +		/* status is valid only when START_BUSY is cleared */
> +		if (!(val & BIT(S_CMD_START_BUSY_SHIFT))) {
> +			val = (val >> S_CMD_STATUS_SHIFT) & S_CMD_STATUS_MASK;
> +			if (val == S_CMD_STATUS_TIMEOUT ||
> +			    val == S_CMD_STATUS_MASTER_ABORT) {
> +				dev_warn(iproc_i2c->device,
> +					 (val == S_CMD_STATUS_TIMEOUT) ?
> +					 "slave random stretch time timeout\n" :
> +					 "Master aborted read transaction\n");
> +				recover = true;
> +			}
> +		}
> +	}
> +
> +	/* RX_EVENT is not valid when START_BUSY is set */
> +	if ((status & BIT(IS_S_RX_EVENT_SHIFT)) &&
> +	    (status & BIT(IS_S_START_BUSY_SHIFT))) {
> +		dev_warn(iproc_i2c->device, "Slave aborted read transaction\n");
> +		recover = true;
> +	}
>  
> -	val = (val >> S_CMD_STATUS_SHIFT) & S_CMD_STATUS_MASK;
> -	if (val == S_CMD_STATUS_TIMEOUT || val == S_CMD_STATUS_MASTER_ABORT) {
> -		dev_err(iproc_i2c->device, (val == S_CMD_STATUS_TIMEOUT) ?
> -			"slave random stretch time timeout\n" :
> -			"Master aborted read transaction\n");
> +	if (recover) {
>  		/* re-initialize i2c for recovery */
>  		bcm_iproc_i2c_enable_disable(iproc_i2c, false);
>  		bcm_iproc_i2c_slave_init(iproc_i2c, true);
>  		bcm_iproc_i2c_enable_disable(iproc_i2c, true);
>  	}
> +
> +	return recover;
>  }
>  
>  static void bcm_iproc_i2c_slave_read(struct bcm_iproc_i2c_dev *iproc_i2c)
> @@ -420,48 +438,6 @@ static bool bcm_iproc_i2c_slave_isr(struct bcm_iproc_i2c_dev *iproc_i2c,
>  	u32 val;
>  	u8 value;
>  
> -	/*
> -	 * Slave events in case of master-write, master-write-read and,
> -	 * master-read
> -	 *
> -	 * Master-write     : only IS_S_RX_EVENT_SHIFT event
> -	 * Master-write-read: both IS_S_RX_EVENT_SHIFT and IS_S_RD_EVENT_SHIFT
> -	 *                    events
> -	 * Master-read      : both IS_S_RX_EVENT_SHIFT and IS_S_RD_EVENT_SHIFT
> -	 *                    events or only IS_S_RD_EVENT_SHIFT
> -	 *
> -	 * iproc has a slave rx fifo size of 64 bytes. Rx fifo full interrupt
> -	 * (IS_S_RX_FIFO_FULL_SHIFT) will be generated when RX fifo becomes
> -	 * full. This can happen if Master issues write requests of more than
> -	 * 64 bytes.
> -	 */
> -	if (status & BIT(IS_S_RX_EVENT_SHIFT) ||
> -	    status & BIT(IS_S_RD_EVENT_SHIFT) ||
> -	    status & BIT(IS_S_RX_FIFO_FULL_SHIFT)) {
> -		/* disable slave interrupts */
> -		val = iproc_i2c_rd_reg(iproc_i2c, IE_OFFSET);
> -		val &= ~iproc_i2c->slave_int_mask;
> -		iproc_i2c_wr_reg(iproc_i2c, IE_OFFSET, val);
> -
> -		if (status & BIT(IS_S_RD_EVENT_SHIFT))
> -			/* Master-write-read request */
> -			iproc_i2c->slave_rx_only = false;
> -		else
> -			/* Master-write request only */
> -			iproc_i2c->slave_rx_only = true;
> -
> -		/* schedule tasklet to read data later */
> -		tasklet_schedule(&iproc_i2c->slave_rx_tasklet);
> -
> -		/*
> -		 * clear only IS_S_RX_EVENT_SHIFT and
> -		 * IS_S_RX_FIFO_FULL_SHIFT interrupt.
> -		 */
> -		val = BIT(IS_S_RX_EVENT_SHIFT);
> -		if (status & BIT(IS_S_RX_FIFO_FULL_SHIFT))
> -			val |= BIT(IS_S_RX_FIFO_FULL_SHIFT);
> -		iproc_i2c_wr_reg(iproc_i2c, IS_OFFSET, val);
> -	}
>  
>  	if (status & BIT(IS_S_TX_UNDERRUN_SHIFT)) {
>  		iproc_i2c->tx_underrun++;
> @@ -493,8 +469,9 @@ static bool bcm_iproc_i2c_slave_isr(struct bcm_iproc_i2c_dev *iproc_i2c,
>  		 * less than PKT_LENGTH bytes were output on the SMBUS
>  		 */
>  		iproc_i2c->slave_int_mask &= ~BIT(IE_S_TX_UNDERRUN_SHIFT);
> -		iproc_i2c_wr_reg(iproc_i2c, IE_OFFSET,
> -				 iproc_i2c->slave_int_mask);
> +		val = iproc_i2c_rd_reg(iproc_i2c, IE_OFFSET);
> +		val &= ~BIT(IE_S_TX_UNDERRUN_SHIFT);
> +		iproc_i2c_wr_reg(iproc_i2c, IE_OFFSET, val);
>  
>  		/* End of SMBUS for Master Read */
>  		val = BIT(S_TX_WR_STATUS_SHIFT);
> @@ -515,9 +492,49 @@ static bool bcm_iproc_i2c_slave_isr(struct bcm_iproc_i2c_dev *iproc_i2c,
>  				 BIT(IS_S_START_BUSY_SHIFT));
>  	}
>  
> -	/* check slave transmit status only if slave is transmitting */
> -	if (!iproc_i2c->slave_rx_only)
> -		bcm_iproc_i2c_check_slave_status(iproc_i2c);
> +	/* if the controller has been reset, immediately return from the ISR */
> +	if (bcm_iproc_i2c_check_slave_status(iproc_i2c, status))
> +		return true;
> +
> +	/*
> +	 * Slave events in case of master-write, master-write-read and,
> +	 * master-read
> +	 *
> +	 * Master-write     : only IS_S_RX_EVENT_SHIFT event
> +	 * Master-write-read: both IS_S_RX_EVENT_SHIFT and IS_S_RD_EVENT_SHIFT
> +	 *                    events
> +	 * Master-read      : both IS_S_RX_EVENT_SHIFT and IS_S_RD_EVENT_SHIFT
> +	 *                    events or only IS_S_RD_EVENT_SHIFT
> +	 *
> +	 * iproc has a slave rx fifo size of 64 bytes. Rx fifo full interrupt
> +	 * (IS_S_RX_FIFO_FULL_SHIFT) will be generated when RX fifo becomes
> +	 * full. This can happen if Master issues write requests of more than
> +	 * 64 bytes.
> +	 */
> +	if (status & BIT(IS_S_RX_EVENT_SHIFT) ||
> +	    status & BIT(IS_S_RD_EVENT_SHIFT) ||
> +	    status & BIT(IS_S_RX_FIFO_FULL_SHIFT)) {
> +		/* disable slave interrupts */
> +		val = iproc_i2c_rd_reg(iproc_i2c, IE_OFFSET);
> +		val &= ~iproc_i2c->slave_int_mask;
> +		iproc_i2c_wr_reg(iproc_i2c, IE_OFFSET, val);
> +
> +		if (status & BIT(IS_S_RD_EVENT_SHIFT))
> +			/* Master-write-read request */
> +			iproc_i2c->slave_rx_only = false;
> +		else
> +			/* Master-write request only */
> +			iproc_i2c->slave_rx_only = true;
> +
> +		/* schedule tasklet to read data later */
> +		tasklet_schedule(&iproc_i2c->slave_rx_tasklet);
> +
> +		/* clear IS_S_RX_FIFO_FULL_SHIFT interrupt */
> +		if (status & BIT(IS_S_RX_FIFO_FULL_SHIFT)) {
> +			val = BIT(IS_S_RX_FIFO_FULL_SHIFT);
> +			iproc_i2c_wr_reg(iproc_i2c, IS_OFFSET, val);
> +		}
> +	}
>  
>  	return true;
>  }

This fix looks good to me, and we have reviewed and thoroughly tested it
internally. Thanks.

Acked-by: Ray Jui <ray.jui@broadcom.com>

--0000000000006a64560603fdd594
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
YVhHgdTTB3aAzFyz4UFRLwxCzIG7d7GIiB9MoLImssS08R5WQ5EJCd1fAF6iefLupAn/plPmn2w0
GF8bLF/FhwOn8jObLW5pQiKhjQSv3QIDAQABo4IB1TCCAdEwDgYDVR0PAQH/BAQDAgWgMIGjBggr
BgEFBQcBAQSBljCBkzBOBggrBgEFBQcwAoZCaHR0cDovL3NlY3VyZS5nbG9iYWxzaWduLmNvbS9j
YWNlcnQvZ3NnY2NyM3BlcnNvbmFsc2lnbjJjYTIwMjAuY3J0MEEGCCsGAQUFBzABhjVodHRwOi8v
b2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3IzcGVyc29uYWxzaWduMmNhMjAyMDBNBgNVHSAERjBE
MEIGCisGAQQBoDIBKAowNDAyBggrBgEFBQcCARYmaHR0cHM6Ly93d3cuZ2xvYmFsc2lnbi5jb20v
cmVwb3NpdG9yeS8wCQYDVR0TBAIwADBJBgNVHR8EQjBAMD6gPKA6hjhodHRwOi8vY3JsLmdsb2Jh
bHNpZ24uY29tL2dzZ2NjcjNwZXJzb25hbHNpZ24yY2EyMDIwLmNybDAfBgNVHREEGDAWgRRyYXku
anVpQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAfBgNVHSMEGDAWgBSWM9HmWBdb
NHWKgVZk1b5I3qGPzzAdBgNVHQ4EFgQUIScG7uNJuCYBQieQC+eonQS9tdkwDQYJKoZIhvcNAQEL
BQADggEBAGLwq/sDtwLmkAa5/UpIG4o5HA9EH7SaYi05EUlzrDdIeZsJnXDkxmG9144wNZBbndHx
nKXRnpJjCX4jhZeNQFyY4m5c9c8bMytO4zb8XUJIxCjqkhtukJtqHieEogwGsmZlpOxt6Ucc2JXg
6oTTbyITD4Bvn7cFb7EI2FBcT7K8bf8AvwtNLl/dKYtUA/nEvVhjqp0wsDL3t//Q3GTwGWZB41gf
LC04V6gD9TVFl7i/N48Gu8PzTt4Kt0SZvBr7kQ9PKi7DVyXe23Ou89QVflaja3bPjt2UZCyq0JxJ
Nu5SjFDWjKlBCzbLDGkCBlM4DpjAb0y4MyKOsiVv7vIxNlYxggJtMIICaQIBATBrMFsxCzAJBgNV
BAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYDVQQDEyhHbG9iYWxTaWduIEdD
QyBSMyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwAgwcAgHcg4j27cIp1UUwDQYJYIZIAWUDBAIBBQCg
gdQwLwYJKoZIhvcNAQkEMSIEILNSy6eATU2/YIq/I90NxjojNhTukIv5MUJ+7gxDy0tRMBgGCSqG
SIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTIzMDgyODE2MDMyMlowaQYJKoZI
hvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG
9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFlAwQCATANBgkqhkiG9w0BAQEF
AASCAQBtxVvLR/f6bimvs2oNCEci+1oZ3JLH3WqmJub1pDQfl7TfHSyu3faCJh6l6S4kgTZdtip6
RAKYvamW+fSaSMO9X03Yg8wG23Ms3J6AK/TCkzHTgMhi2c/6Ksdj8jOzmVUFOxvc0QCicR1hzMDS
6H/mU+ZOJjacKBAoxwCRaBDt6ZYCjohreEaMUvAZGdDNKgtBABZskGDnjZNpeDplTncUbnWwjv1V
uI1SC1AIuBEMYdjAprfYSPJEfkYu4lDF/GTDc+VyVk4Dk6jEkJq3xXFBzrDohUA34hr103cXwBFi
qCWD28FpX/A77fW0O/iIbGI7CZadSuSjz3ezgwVaVqT7
--0000000000006a64560603fdd594--
