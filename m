Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C05274B498
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jul 2023 17:50:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229556AbjGGPuo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Jul 2023 11:50:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbjGGPun (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 Jul 2023 11:50:43 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBA05173B
        for <linux-i2c@vger.kernel.org>; Fri,  7 Jul 2023 08:50:42 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-7659924cd9bso202423685a.1
        for <linux-i2c@vger.kernel.org>; Fri, 07 Jul 2023 08:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1688745042; x=1691337042;
        h=in-reply-to:from:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MblNBnv+K0F3XSVASsJiHDgq+KhmJlPYCiE7buLR6eA=;
        b=gAtMLc7kQXHmDOf+OSfS/fzILKJxsu60QwnjL+pVpMbHGe7hbbhaXhowBDMG0cxGC7
         3SOuszSxRRvzed0Kqq4OSaU3b0kENs074EQ35UEYZEM6bkM3ORBld2XITfwwEaOEug1o
         2fzyA7AcWOErht1Ap08Yv1KPgnSWHrsNKE28w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688745042; x=1691337042;
        h=in-reply-to:from:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MblNBnv+K0F3XSVASsJiHDgq+KhmJlPYCiE7buLR6eA=;
        b=U9uc+6a8hs8Tp0cE9LLCPHeWhUMXZBoRmnW4zcLL9hAJo5znkZ++cbA3VQRDCDpDy7
         4sh0rpPxqORzvxjBt4DSwOiX+oE8ldZDvbA5tBkc8jHZMtSAJ1TcmsvdZedQ2KCwq3wf
         JE2mi15M+UOKT2QhfI14Q/nfgvZsWEfdGIL7qDEJeYLhMCgNeQpGcH3iqN6pH7+GpjDh
         aufaof/wPNRs5qe8HaT1aID4d+428W118RV5NnOj2bo7v3kCnt83WA9I/OxR7lHQujY0
         ZmRjo7gFZ2C83nD1vP7btKoTv+1g1LU6+DJZUXikAGYVx2K/bM0a5S0IvWo/nkqDD9TA
         XABA==
X-Gm-Message-State: ABy/qLbhIijFlz7XZ4l1f6IvAK02CquJhJJRfewNokHBqXeyc9zvzGxh
        z0VqlMe0lEFXyU16Uvi+v3IExg==
X-Google-Smtp-Source: APBJJlFN2nocxSf9TcaIIz2ohyopOIqwWkiEgKKHQwwdEysttD2w7GwA1bbUozw0vhin3BWdCkP3Sg==
X-Received: by 2002:a05:620a:17a7:b0:763:b4d7:51c1 with SMTP id ay39-20020a05620a17a700b00763b4d751c1mr7126782qkb.50.1688745041910;
        Fri, 07 Jul 2023 08:50:41 -0700 (PDT)
Received: from [10.136.64.163] ([192.19.161.248])
        by smtp.gmail.com with ESMTPSA id z23-20020ae9c117000000b00765a9f53af0sm1909493qki.128.2023.07.07.08.50.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jul 2023 08:50:41 -0700 (PDT)
Message-ID: <6e6d8cfd-63fd-f3b5-7ab0-a4d99895a17c@broadcom.com>
Date:   Fri, 7 Jul 2023 08:50:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2] i2c: bcm-iproc: Fix bcm_iproc_i2c_isr deadlock issue
To:     Chengfeng Ye <dg573847474@gmail.com>, andi.shyti@kernel.org,
        rjui@broadcom.com, sbranden@broadcom.com, wsa@kernel.org
Cc:     bcm-kernel-feedback-list@broadcom.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230707084941.28964-1-dg573847474@gmail.com>
From:   Ray Jui <ray.jui@broadcom.com>
In-Reply-To: <20230707084941.28964-1-dg573847474@gmail.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
        boundary="0000000000005d5ce405ffe7986f"
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

--0000000000005d5ce405ffe7986f
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/7/2023 1:49 AM, Chengfeng Ye wrote:
> iproc_i2c_rd_reg() and iproc_i2c_wr_reg() are called from both
> interrupt context (e.g. bcm_iproc_i2c_isr) and process context
> (e.g. bcm_iproc_i2c_suspend). Therefore, interrupts should be
> disabled to avoid potential deadlock. To prevent this scenario,
> use spin_lock_irqsave().
> 
> Fixes: 9a1038728037 ("i2c: iproc: add NIC I2C support")
> Signed-off-by: Chengfeng Ye <dg573847474@gmail.com>
> ---
>  drivers/i2c/busses/i2c-bcm-iproc.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2c-bcm-iproc.c
> index 85d8a6b04885..30a2a3200bed 100644
> --- a/drivers/i2c/busses/i2c-bcm-iproc.c
> +++ b/drivers/i2c/busses/i2c-bcm-iproc.c
> @@ -233,13 +233,14 @@ static inline u32 iproc_i2c_rd_reg(struct bcm_iproc_i2c_dev *iproc_i2c,
>  				   u32 offset)
>  {
>  	u32 val;
> +	unsigned long flags;
>  
>  	if (iproc_i2c->idm_base) {
> -		spin_lock(&iproc_i2c->idm_lock);
> +		spin_lock_irqsave(&iproc_i2c->idm_lock, flags);
>  		writel(iproc_i2c->ape_addr_mask,
>  		       iproc_i2c->idm_base + IDM_CTRL_DIRECT_OFFSET);
>  		val = readl(iproc_i2c->base + offset);
> -		spin_unlock(&iproc_i2c->idm_lock);
> +		spin_unlock_irqrestore(&iproc_i2c->idm_lock, flags);
>  	} else {
>  		val = readl(iproc_i2c->base + offset);
>  	}
> @@ -250,12 +251,14 @@ static inline u32 iproc_i2c_rd_reg(struct bcm_iproc_i2c_dev *iproc_i2c,
>  static inline void iproc_i2c_wr_reg(struct bcm_iproc_i2c_dev *iproc_i2c,
>  				    u32 offset, u32 val)
>  {
> +	unsigned long flags;
> +
>  	if (iproc_i2c->idm_base) {
> -		spin_lock(&iproc_i2c->idm_lock);
> +		spin_lock_irqsave(&iproc_i2c->idm_lock, flags);
>  		writel(iproc_i2c->ape_addr_mask,
>  		       iproc_i2c->idm_base + IDM_CTRL_DIRECT_OFFSET);
>  		writel(val, iproc_i2c->base + offset);
> -		spin_unlock(&iproc_i2c->idm_lock);
> +		spin_unlock_irqrestore(&iproc_i2c->idm_lock, flags);
>  	} else {
>  		writel(val, iproc_i2c->base + offset);
>  	}

Acked-by: Ray Jui <ray.jui@broadcom.com>

Thanks, Chengfeng.

--0000000000005d5ce405ffe7986f
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
gdQwLwYJKoZIhvcNAQkEMSIEIN4dGdvzE6b+VqvLwd49+hde3mhGEmn+/hE+/D5BR7lTMBgGCSqG
SIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTIzMDcwNzE1NTA0MlowaQYJKoZI
hvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG
9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFlAwQCATANBgkqhkiG9w0BAQEF
AASCAQAS6tvPPNK0CGuf/DFOh4gF8IeFXJNmHBWi3N8ed5dndW9tda2p4uCdVcISoTysOQ/ezU47
GR/o6z5D6jo2/h9vxUQyMnMhdGmrzc6jEx6eByQES3oN3r2/L1xH0zFePkk0YAOhB9eL/m9uRHUO
pbK2pRl+g5IFeewpfTWaY02mXWZ4ecEX0Q4ky03NWF/ErVWte53IARt+nntrR0A2huw5yUCOQFTr
uA3Ootga9VQxyXdBgeDEZXQXLGB9oS0O+s3LS3MCpc5I5hZ8K2RDeKGdITZ/1HJneugMFH0BbPVu
NExsVR2MeFzyJxql6AyaisDELmXFZ+Wyi/GLeayfTtRM
--0000000000005d5ce405ffe7986f--
