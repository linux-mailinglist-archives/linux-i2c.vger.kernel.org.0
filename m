Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67391735B8F
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Jun 2023 17:53:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231696AbjFSPxF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Jun 2023 11:53:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229629AbjFSPxE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Jun 2023 11:53:04 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6ADEC186;
        Mon, 19 Jun 2023 08:53:03 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-51a5eec783cso1104639a12.3;
        Mon, 19 Jun 2023 08:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687189982; x=1689781982;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vOPr1z9vlSr5spRntqrxIkfrh9a7FoSLQdUEXV07vyE=;
        b=CGp4cmw96jKKbtcMkKQb6HKOiaUVBetI5OoP1lV3nt1XlXsRpOJ6aJR55iRZe42MOH
         d3XkWQJz1eeZ9MVZiFR/jQxtdvY8ABkaxxAys3Woxt40xPjmV9ojkFiY3z7F1J09p15S
         m6EqSAneZHzENs96TSZ31iPYvgU8pUz2XSv9vU9n8JeJTxYHUuATAdfE0gSrKVcxW9ZS
         pYBDT2i48SdHC2zdt1iNODZaNRB8qpUnVh81PcfDfAl6xdESs/b9cqaZKEpJMDCF3S/z
         fTaZSyRl/FDhpw8vTCWBzj94zscL5RulsrIxYuwFv+9etWxuxsfAO8VPVSgh6lnI0ALn
         NFxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687189982; x=1689781982;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vOPr1z9vlSr5spRntqrxIkfrh9a7FoSLQdUEXV07vyE=;
        b=BY7Fgsu1lytziaJYjdNJThhShyVfLuibDUozjBZ+UqXvjOQfNQ0mqafisw7KleP+hy
         pCfXxfYTYIdxSbLJYTFkUID4osN+8+fI2CMNUzRoNUZeq+BtLd4ifqgjPq5JbE9KirxO
         z4WZpKkdMR7jJpTHI0yFu+pzUf8JS/PEy+JlojvKSDRtQTsn56uHGoxqxcA6cony4XYR
         wbdP2Js4wOBGITtdhxsPZh0u/JF5UsX1yYO/Jq1JxZQgQewtlLZWz1dGmmIqP6M+T2Rh
         Ju4wfbpRX5EzDcY49j9D33XL3J0yj/1cHSfNI2hICM5mjwjvhWPduDIT/bthkIi1UBbv
         wRqQ==
X-Gm-Message-State: AC+VfDyuM54q7TT9pmh2waf8MSkTm5eTJy8L6Ql8sA1nqUGfTahQHkR2
        2JWh4G+9FIPcKTOC1HjlSEuu+Te2lrmrZl3OugQaU+0STtk=
X-Google-Smtp-Source: ACHHUZ5qPy3Y95u+AZJvki/P+LidrnXzCwctg81KDPqToTjNO1sequUNWrs93Asp3WpYdG5kwnW4Ui0NqPhwAMNzZoE=
X-Received: by 2002:a17:906:da84:b0:988:f307:aea7 with SMTP id
 xh4-20020a170906da8400b00988f307aea7mr812098ejb.7.1687189981732; Mon, 19 Jun
 2023 08:53:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230619153732.46258-1-clamor95@gmail.com> <30c50635-ff42-3a85-a419-673ca6d0422e@linaro.org>
In-Reply-To: <30c50635-ff42-3a85-a419-673ca6d0422e@linaro.org>
From:   Svyatoslav Ryhel <clamor95@gmail.com>
Date:   Mon, 19 Jun 2023 18:52:50 +0300
Message-ID: <CAPVz0n1fo7EjAC-UUVawQoeP4AhwRWAg1MZyremNDHFdta+Reg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] GPIO-based hotplug i2c bus
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

=D0=BF=D0=BD, 19 =D1=87=D0=B5=D1=80=D0=B2. 2023=E2=80=AF=D1=80. =D0=BE 18:4=
9 Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On 19/06/2023 17:37, Svyatoslav Ryhel wrote:
> > ASUS Transformers require this driver for proper work with their dock.
> > Dock is controlled by EC and its presence is detected by a GPIO.
> >
> > ---
> > Changes in v2:
> > - adjusted documentation
>
> This is too generic. Everything can be adjustment. Be precise what you
> did here. What changed?
>

Everything that you asked for.

> Best regards,
> Krzysztof
>
