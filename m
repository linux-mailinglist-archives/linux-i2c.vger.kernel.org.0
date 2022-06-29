Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2924655FA2F
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Jun 2022 10:15:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229846AbiF2IPa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Jun 2022 04:15:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229772AbiF2IP3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Jun 2022 04:15:29 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AECB23B559
        for <linux-i2c@vger.kernel.org>; Wed, 29 Jun 2022 01:15:27 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id z41so2527177ede.1
        for <linux-i2c@vger.kernel.org>; Wed, 29 Jun 2022 01:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=8tY4XO7tgRZzchD7LlRB/fCh4Gvcc6mOPpWaFNCvH1A=;
        b=kr3zKYErJvsttiafT0lPeJcMpA+0l2OqkCYg+jmgCxobSD7QLh+Ob6f6sJ2vehWNWs
         14CPVoH7gnUM7f/EgOBZrkFAKs0zK2NP9q/+8wWvV4r2q6nnhQy0mitzKKhyJIi9+ZBf
         BwbUJ+01/igmtNYgrxp5yyUFpH7KQAR3FN6fgMNOqGh6sMna9P3iN2X7A4eXTGYAOGJu
         RF0e+N0/6PY4j9mztiUZOAyxqPG96rDKweCjlYt8lRSmOOmFEEBBZlyuAZp0OsUCMh2J
         R2+MnRVcDL0bB4cYTMy8usaJX6mOM2GV99NstvpeAK1uiOilzVby41wiee81YD7Yhrwa
         lE5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=8tY4XO7tgRZzchD7LlRB/fCh4Gvcc6mOPpWaFNCvH1A=;
        b=aTCf+0cyvTKTeMSPReKlY+Cc/vGuiUtvHVMpnNoISdC2TefwtgzkuGzEghNOJkv191
         9s7uaVnXfSpB3HjChCarQx2b5r1lIxEhsra+vNuo0DYojbQ/sWyiJNfRuKKc2p+kZsAi
         U6Eqp3pHRC4NFhEIgt5Kg9llESQwrMU6XDUf6BY+K/bJGq1CGKEGfw2c2FF4pNNp6xdM
         eGAL58w2qm2feGyhgkRUMhSHUbuubxVT0jlVK5shwv33vH78q8U0Un/vyJGj1/0Wpsbc
         nnXIB+A1tj59A50UWqmibiZ29GctnBKlxXtG1gntUHKS+LLSpsyZkb7xZXnZ2WYgGkKr
         e4Yw==
X-Gm-Message-State: AJIora8cEoPl4+29emBKjfyutmzAw+naIMnUJhatRp+xKPX9VBx07MBS
        6iFY7331rI9ikLG0CxRLZMZ+1Q==
X-Google-Smtp-Source: AGRyM1sFY7NCYQCfMxGe9czVB/WSOqGUlaOPE/PgqmHtHSMn/s2OMIPw2M/OJ5sI/ISRcELIcijPoA==
X-Received: by 2002:a05:6402:104a:b0:435:c7cd:11dc with SMTP id e10-20020a056402104a00b00435c7cd11dcmr2542628edu.335.1656490526235;
        Wed, 29 Jun 2022 01:15:26 -0700 (PDT)
Received: from [192.168.0.183] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id ci3-20020a170906c34300b00722ea7a7aeesm7387868ejb.51.2022.06.29.01.15.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jun 2022 01:15:24 -0700 (PDT)
Message-ID: <43a19f7f-016a-0820-adf1-41419fe82d28@linaro.org>
Date:   Wed, 29 Jun 2022 10:15:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 1/2] dt-bindings: i2c: Document RZ/V2M I2C controller
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Rob Herring <robh@kernel.org>
Cc:     Phil Edworthy <phil.edworthy@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <20220628194526.111501-1-phil.edworthy@renesas.com>
 <20220628194526.111501-2-phil.edworthy@renesas.com>
 <1656468579.925440.1403681.nullmailer@robh.at.kernel.org>
 <CAMuHMdVsdh1YpVtq7570_kNOWUm5sMb=Fm=Dv_8qOS=hg3iuKA@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAMuHMdVsdh1YpVtq7570_kNOWUm5sMb=Fm=Dv_8qOS=hg3iuKA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 29/06/2022 08:53, Geert Uytterhoeven wrote:
> Hi Rob,
> 
> On Wed, Jun 29, 2022 at 4:09 AM Rob Herring <robh@kernel.org> wrote:
>> On Tue, 28 Jun 2022 20:45:25 +0100, Phil Edworthy wrote:
>>> Document Renesas RZ/V2M (r9a09g011) I2C controller bindings.
>>>
>>> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
>>> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
>>> ---
>>> v2:
>>>  - Use an enum and set the default for clock-frequency
>>>  - Add resets property
>>> ---
>>>  .../bindings/i2c/renesas,rzv2m.yaml           | 80 +++++++++++++++++++
>>>  1 file changed, 80 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/i2c/renesas,rzv2m.yaml
>>>
>>
>> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
>> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>>
>> yamllint warnings/errors:
>>
>> dtschema/dtc warnings/errors:
>> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/temperature/adi,ltc2983.yaml: patternProperties:^thermistor@:properties:adi,excitation-current-nanoamp: '$ref' should not be valid under {'const': '$ref'}
>>         hint: Standard unit suffix properties don't need a type $ref
>>         from schema $id: http://devicetree.org/meta-schemas/core.yaml#
>> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/temperature/adi,ltc2983.yaml: ignoring, error in schema: patternProperties: ^thermistor@: properties: adi,excitation-current-nanoamp
>> Documentation/devicetree/bindings/iio/temperature/adi,ltc2983.example.dtb:0:0: /example-0/spi/ltc2983@0: failed to match any schema with compatible: ['adi,ltc2983']
> 
> All of these look like false-positives, i.e. not related to this patch?

Few other patches also got it, I think the bot got some problem.


Best regards,
Krzysztof
