Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 127C474A77F
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jul 2023 01:19:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229507AbjGFXTd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Jul 2023 19:19:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230362AbjGFXTd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Jul 2023 19:19:33 -0400
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8B921BC3
        for <linux-i2c@vger.kernel.org>; Thu,  6 Jul 2023 16:19:31 -0700 (PDT)
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-635e54e22d6so9246446d6.2
        for <linux-i2c@vger.kernel.org>; Thu, 06 Jul 2023 16:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1688685571; x=1691277571;
        h=in-reply-to:from:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hQ7muwG3TkYR9PrUVWGBd1Otj3q5y/bXr6MR4yOWqOQ=;
        b=IgkepAe//KjTXFpQuuZZE0Y9UwXXw9aBPMByYmlOYhZAJXe6RhTGxNdpZ/bI9ZIosk
         fJfrVRP+/VUfqsE1nwD21kh/oAecxe5acxxI0I3iUE6UonsQ5pbp0wPxEbN37dxlwLya
         2ojoUe7QXF9yoecL2TeugGWExjkMTBFfH5GCc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688685571; x=1691277571;
        h=in-reply-to:from:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hQ7muwG3TkYR9PrUVWGBd1Otj3q5y/bXr6MR4yOWqOQ=;
        b=amJam01uXhFQz6yKOhDBCGjBe5Cu98fXVZ+jghd80VejgbwG033IsUDwyhUsIncYRM
         IZvOB6+FvJrQrU+MTeSRbezcB10u9WMQO1EycwnlH2X4E3DGL8K4QkFUFIRVp+NrbMu2
         WNNvJERLQ24dF1oQkKPVx8eQHqFAqLPduV/edIHdyzQUtEOE4uagVkg4+ZCxymyvkNHS
         8fYIcf0W4z5Uhp1NyjBNxjZbAxKbt+Qa1Po8MzXMTxOziDBW6jBjqxO8qxKHtqD7E8r6
         EE2LSN86HbznRaQgyG6AIadGgXZ/zVb5IC/a0rmaqvU7G4Wf4c7rmgRhbtP1Cv04k/vw
         RlzQ==
X-Gm-Message-State: ABy/qLYCa46u+tLnXqVs6vkTBXLmJPQ8ouY6GWfKkKt7ZUst8Q6AwaGS
        e7L31OJiGu3E1Tvy/lx1NCW0Xg==
X-Google-Smtp-Source: APBJJlEKz0oCncN98+0t9WWh6lKRQD7FmM3+bXwt27Xu72YxRa0Mqs6PLxQCCxYH/wRwrTMehIWsoQ==
X-Received: by 2002:a0c:b71a:0:b0:636:8476:7a3e with SMTP id t26-20020a0cb71a000000b0063684767a3emr2682442qvd.36.1688685570542;
        Thu, 06 Jul 2023 16:19:30 -0700 (PDT)
Received: from [10.136.64.163] ([192.19.161.248])
        by smtp.gmail.com with ESMTPSA id k19-20020a0cf293000000b00630173b9a7asm1406194qvl.71.2023.07.06.16.19.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jul 2023 16:19:29 -0700 (PDT)
Message-ID: <499444bd-3699-edbc-d6c6-748d24a2387a@broadcom.com>
Date:   Thu, 6 Jul 2023 16:19:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH RESEND] i2c: bcm-iproc: Fix bcm_iproc_i2c_isr deadlock
 issue
To:     Chengfeng Ye <dg573847474@gmail.com>, andi.shyti@kernel.org,
        rjui@broadcom.com, sbranden@broadcom.com, wsa@kernel.org
Cc:     bcm-kernel-feedback-list@broadcom.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230706211414.10660-1-dg573847474@gmail.com>
 <CAAo+4rW1kmiVGbGxMUBsggQiY7dpOTUq+t6B=QTrikwBp72Kkw@mail.gmail.com>
From:   Ray Jui <ray.jui@broadcom.com>
In-Reply-To: <CAAo+4rW1kmiVGbGxMUBsggQiY7dpOTUq+t6B=QTrikwBp72Kkw@mail.gmail.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
        boundary="0000000000009a9fe605ffd9bf7d"
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

--0000000000009a9fe605ffd9bf7d
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/6/2023 2:21 PM, Chengfeng Ye wrote:
> Hi Ray and Wolfram,
> 
>> I can't apply it, what version is this against?
> 
> The patch is based on 6.4-rc7. I resend the patch with this
> email because I had some problems setting up the previous
> one with git send-email. That patch was manually pasted
> so that might be the reason for not being able to be applied.
> 
> Best Regards,
> Chengfeng

I saw your latest patch. You should use prefix of [PATCH V2]
instead of [PATCH RESEND].

Also, can you please add the fix tag I identified to your commit
message. That will save Wolfram some
manual work.

Thanks,

Ray

--0000000000009a9fe605ffd9bf7d
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
gdQwLwYJKoZIhvcNAQkEMSIEIOGxTEicVY/qS2rShXCLfkuqJ99bjGfvDUn+7bJ0lRivMBgGCSqG
SIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTIzMDcwNjIzMTkzMVowaQYJKoZI
hvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG
9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFlAwQCATANBgkqhkiG9w0BAQEF
AASCAQCuke4UTCsDrdT6j/b8CIQmQzKq78OUO3FowapBAA6nbo/JZXX2zRN8SKH2C00dDlk/vmUJ
w3TYD80sgTJCS50GBaQJMYL+rrPjKa6vKOu5ABic8CxdTzeyQqWKR7ZsgXllDFkTDIVn142Hqb/l
eOBkM0DKqx+8vbwX90osqz7FgE8nMDEVEzchQPGoEzJ1ZXR5CjSp2fdQIMt40nI8fqVq/PzMsump
QvxDt8LV+7ye9qb4clGNWvaVBhO4tPyL1q9u5316RgatMmDtQsyZAQFk8x4Bx6CzaI+rskSWC2rY
iX7LgmrJqAmnlbjJbBlBK1PlwisJmrRlXWtQymePCvdL
--0000000000009a9fe605ffd9bf7d--
