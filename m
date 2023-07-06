Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D355474A765
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jul 2023 01:06:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231136AbjGFXF7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Jul 2023 19:05:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230232AbjGFXF6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Jul 2023 19:05:58 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 650361737
        for <linux-i2c@vger.kernel.org>; Thu,  6 Jul 2023 16:05:56 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1b8ad356fe4so7266285ad.2
        for <linux-i2c@vger.kernel.org>; Thu, 06 Jul 2023 16:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1688684756; x=1691276756;
        h=in-reply-to:from:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kgIZl28ZqGF5ftfOyzWvBX5NrnGgq48OaKJN2aHQafE=;
        b=IKCdsUSA2IL1jQzF2gbU7+9qbXtQt/wTSCsk9FlruKhmpFFcNAJ79v+llvFNBghCbw
         t9mXUbc+/QIp9Bgr9qmZCrAfyalJqcpRbchoOCw7NNMyCOdhaVKj3LTiE5WNtp2Y0dmM
         48/ORhxRZ1zCfS98lDF6aXToW97+UI3W+0sDI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688684756; x=1691276756;
        h=in-reply-to:from:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kgIZl28ZqGF5ftfOyzWvBX5NrnGgq48OaKJN2aHQafE=;
        b=c5/MflbF/Cos9CQSIIgT0kdLU4CR+T4QLNJ4kfrbYpchcB2n0s2blQ5DcrN7mEUZQi
         rrmt6IMVcf1Yz8Jfjlll4BPxrEyueP7XPJg6E82UFE8uWFx3fEEp1XxDuhoNMN7/EI63
         PWDxUtvlQp8NDqKShSRx+hfBuTdguIr/5YZIZu6xe94SSurTSdRZWhDFlfyISZi5WxL8
         lOkDUFOZCAw+ynjGCpG1xokcc2zLupH9ZY7vwYNv4bK785B4GBkyEVBNYhNvNjVmWSbH
         LbYtgEIM3mWVBT4jYAZQ238dzukXN/CzO866H2GoPMJ04uvhib156TO8wg1l3JfqXNX+
         IvFw==
X-Gm-Message-State: ABy/qLaTuZztT7oIZn9Ks60Nv/OorZkmbzsRPDlvg6e4JhsrU+M5qN1b
        5g8whCrm+s/ENWLTW2IMGmGERg==
X-Google-Smtp-Source: APBJJlHaqsUa8BHCaF6EfQZDp4Dnq002Nf5Yedyr6qvDbRuuVKDKm/j+oD1hSqhbDIU911i7F0qTGw==
X-Received: by 2002:a17:902:ce8b:b0:1af:b957:718b with SMTP id f11-20020a170902ce8b00b001afb957718bmr2933808plg.39.1688684755779;
        Thu, 06 Jul 2023 16:05:55 -0700 (PDT)
Received: from [10.136.13.65] ([192.19.161.248])
        by smtp.gmail.com with ESMTPSA id m6-20020a170902db0600b001b016313b1dsm1914675plx.86.2023.07.06.16.05.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jul 2023 16:05:54 -0700 (PDT)
Message-ID: <87f34cb7-6cd2-32b4-7668-e4851e4788ff@broadcom.com>
Date:   Thu, 6 Jul 2023 16:02:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH RESEND] i2c: bcm-iproc: Fix bcm_iproc_i2c_isr deadlock
 issue
To:     Chengfeng Ye <dg573847474@gmail.com>, andi.shyti@kernel.org,
        rjui@broadcom.com, sbranden@broadcom.com, wsa@kernel.org
Cc:     bcm-kernel-feedback-list@broadcom.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230706211414.10660-1-dg573847474@gmail.com>
From:   Scott Branden <scott.branden@broadcom.com>
In-Reply-To: <20230706211414.10660-1-dg573847474@gmail.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
        boundary="000000000000073c9705ffd98f12"
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

--000000000000073c9705ffd98f12
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Some comments inline

On 2023-07-06 14:14, Chengfeng Ye wrote:
> iproc_i2c_rd_reg and iproc_i2c_wr_reg are called from both
> interrupt context (e.g. bcm_iproc_i2c_isr) and process context
> (e.g. bcm_iproc_i2c_suspend). Therefore, interrupts should be
> disabled to avoid potential deadlock. To prevent this scenario,
> use spin_lock_irqsave.
> 
Add Fixes: tag here.
> Signed-off-by: Chengfeng Ye <dg573847474@gmail.com>
> ---
>   drivers/i2c/busses/i2c-bcm-iproc.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2c-bcm-iproc.c
> index 85d8a6b04885..d02245e4db8c 100644
> --- a/drivers/i2c/busses/i2c-bcm-iproc.c
> +++ b/drivers/i2c/busses/i2c-bcm-iproc.c
> @@ -233,13 +233,14 @@ static inline u32 iproc_i2c_rd_reg(struct bcm_iproc_i2c_dev *iproc_i2c,
>   				   u32 offset)
>   {
>   	u32 val;
> +	unsigned long flags;
>   
>   	if (iproc_i2c->idm_base) {
> -		spin_lock(&iproc_i2c->idm_lock);
> +		spin_lock_irqsave(&iproc_i2c->idm_lock, flags);
>   		writel(iproc_i2c->ape_addr_mask,
>   		       iproc_i2c->idm_base + IDM_CTRL_DIRECT_OFFSET);
>   		val = readl(iproc_i2c->base + offset);
> -		spin_unlock(&iproc_i2c->idm_lock);
> +		spin_unlock_irqrestore(&iproc_i2c->idm_lock, flags);
>   	} else {
>   		val = readl(iproc_i2c->base + offset);
>   	}
> @@ -250,12 +251,13 @@ static inline u32 iproc_i2c_rd_reg(struct bcm_iproc_i2c_dev *iproc_i2c,
>   static inline void iproc_i2c_wr_reg(struct bcm_iproc_i2c_dev *iproc_i2c,
>   				    u32 offset, u32 val)
>   {
> +	unsigned long flags;
Add newline after variable declarations.
>   	if (iproc_i2c->idm_base) {
> -		spin_lock(&iproc_i2c->idm_lock);
> +		spin_lock_irqsave(&iproc_i2c->idm_lock, flags);
>   		writel(iproc_i2c->ape_addr_mask,
>   		       iproc_i2c->idm_base + IDM_CTRL_DIRECT_OFFSET);
>   		writel(val, iproc_i2c->base + offset);
> -		spin_unlock(&iproc_i2c->idm_lock);
> +		spin_unlock_irqrestore(&iproc_i2c->idm_lock, flags);
>   	} else {
>   		writel(val, iproc_i2c->base + offset);
>   	}

--000000000000073c9705ffd98f12
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
aon9PduLGVgSMfiFb2nQ2w0PzDSefbrZKRQAGcSvcQlWb8XU7YKGbLhjR9c/r3KF4iUW8w2T2pd+
bO6aQXt8b1C9YG/V+B65TuJXxgX0veIJEyP+Cl0Im5vNwwIDAQABo4IB2zCCAdcwDgYDVR0PAQH/
BAQDAgWgMIGjBggrBgEFBQcBAQSBljCBkzBOBggrBgEFBQcwAoZCaHR0cDovL3NlY3VyZS5nbG9i
YWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyM3BlcnNvbmFsc2lnbjJjYTIwMjAuY3J0MEEGCCsGAQUF
BzABhjVodHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3IzcGVyc29uYWxzaWduMmNhMjAy
MDBNBgNVHSAERjBEMEIGCisGAQQBoDIBKAowNDAyBggrBgEFBQcCARYmaHR0cHM6Ly93d3cuZ2xv
YmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wCQYDVR0TBAIwADBJBgNVHR8EQjBAMD6gPKA6hjhodHRw
Oi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjNwZXJzb25hbHNpZ24yY2EyMDIwLmNybDAlBgNV
HREEHjAcgRpzY290dC5icmFuZGVuQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAf
BgNVHSMEGDAWgBSWM9HmWBdbNHWKgVZk1b5I3qGPzzAdBgNVHQ4EFgQU8+MSO/sprODwb9D5cjaq
JNiLqgkwDQYJKoZIhvcNAQELBQADggEBAA25uPHwC95BhvFXuEOAk+J5FZV4v82uly/X7LATDzrf
tsww461GRAidKV8lvziiIw6OQQgO9Ei/yC8bVdzDLQJF2PhxcWhc+4II6AkUyRC+Tmfk7xmPEYSv
MHgQfpwPU6C1o4FI/8XjfJgk1dE4j4v16iLKC2qfBqfdzdT/cJaCg/fZfL0w5RLtGOOVIMBWwObx
UKmtYSCgcvRKmLailjlxgiUaYgxdZSpwR0RvFJapt0KzMR5OIP96iyXYVWbl9qy8uY9gqEeNaaQm
Bt8T4oEXHxRvse+Ij162RjEysEsDgkiE/koCb3YFlkVu5lL1N0M7EIo+XiuWWUEjuhztPasxggJt
MIICaQIBATBrMFsxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYD
VQQDEyhHbG9iYWxTaWduIEdDQyBSMyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwAgxPA+M+AQMMGpZn
bCswDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEIIiRLpsP8ZyT1gh1pzu0OUy0JLQa
jfdyDUt/LYV13PmOMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTIz
MDcwNjIzMDU1NlowaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsG
CWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFl
AwQCATANBgkqhkiG9w0BAQEFAASCAQCTPKqFsfWNFW8fiZcu4WheHYLCp02bm3wqpGGhRj0yl3xv
ljrPxLntEcKmMywg4WxU/22V5+th6MPuLpDpMDcyEOeq+K130auHcidGL/tT9fE6I7oyao7gG3MX
SxSIGoFQKU+8hAWLlAcsFcZr3pilh5p0s+Zf//HjN7i5GgqZMLb1nrbcVb7S97FZHB/e4JUJOCpj
T4jWcYyGXdaCZoa9jI/qESKDPyV/brIyDThRMTf75X9F/d1k/PPyXAeFsoX+XsVhDcVKL5Wa19Go
FsMpOpJ+XIwRBJx2Gr5oB6LI7UyQcnnaJiccPsza5f5RBeunmRsRPp9PuVLUh0NQVB7t
--000000000000073c9705ffd98f12--
