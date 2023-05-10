Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC83E6FE0A7
	for <lists+linux-i2c@lfdr.de>; Wed, 10 May 2023 16:43:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237577AbjEJOn3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 10 May 2023 10:43:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237565AbjEJOn2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 10 May 2023 10:43:28 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B95BB114
        for <linux-i2c@vger.kernel.org>; Wed, 10 May 2023 07:43:27 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-965ab8ed1fcso1326722166b.2
        for <linux-i2c@vger.kernel.org>; Wed, 10 May 2023 07:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683729806; x=1686321806;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oDVdWICwavrWQ8UAVYhe8ynFXsBBW1vVQ7W08zgiq24=;
        b=l6To9sPEpSbIWjVuYFn3N8A4xyUkOSXWPU+gac7BMA1NKvt+vlSB4BSYdxIBeLdq6I
         7J3FwoXiu9g48a3GUDp9he3aNiTphlqmPsAS57dP7BAAPxg7YaR5MkMEbW9qdJHJPI3B
         TapmipPRJb44QBIEDWQhKCVzABz5zWw5J2x/KjMBQ5PPW7r3I9jt/uCGGgg9CPwM52ZJ
         xWAsJlA9jtBg5BxLdh26ImhCHXPee2eC7QKZmXkcvZhZNRnwHvYwd2OcCcSyZVcwiYLR
         oLs/rGfXRpqmiM5W0IDdhvbc5ugGTkbC50P9KESnX433/nodsVtKjUMeLRYYETlzfO+R
         bmCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683729806; x=1686321806;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oDVdWICwavrWQ8UAVYhe8ynFXsBBW1vVQ7W08zgiq24=;
        b=ksAVUt+4Y2GwBliLFgHGHJ6VhZ9IeQrGEGnm/A2eTynkvNqGxqn/Xtb2oXHez3CljT
         VK43aISYYN8RA+g4oczNtFa/r/4u7hh4SdjuvzWfIZw+ZimDqotrg9NODRNdZFq+0tMJ
         JeXnUss25Fk0gpphuhggvv89tnJ3/nmAyn8aI/RNzSwh/7lYyLedd3sqxbE1EjadW8PS
         Ir+oil71o2/SaAja0rQm10soN7LHYbyH62eNdxDZZqvkvut8pKhqe43lbDdPqHAnrXeZ
         nkXCg1QFQlpQYH8iaxUXe1V+Pyx4rIXLze7gY4ELo+/oZEFv36l9R/prRN92fm6/K8D7
         C6OA==
X-Gm-Message-State: AC+VfDxVU7BClBFzzKxvdNFVZ1p6hN4so2ayZJtiR0TTdmTvNcPMK9cV
        HwMCuMmDV9xhv/CJ2cDySS5ebTgw0ih7XkKmsxb8pI4LrbZiEQ==
X-Google-Smtp-Source: ACHHUZ6DN8RuAX6s2lS63jiwkU/AaCfNfZ6u9DthVIAEiXvwt46sQnPXhcpTtaIqDbw80DBuKTIBBlCxBKEmyC2yy7I=
X-Received: by 2002:a17:906:db0d:b0:94a:35d1:59a with SMTP id
 xj13-20020a170906db0d00b0094a35d1059amr14117358ejb.14.1683729806136; Wed, 10
 May 2023 07:43:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab4:a502:0:b0:209:c5a4:ad9a with HTTP; Wed, 10 May 2023
 07:43:25 -0700 (PDT)
Reply-To: ninacoulibaly03@hotmail.com
From:   nina coulibaly <coulibalynina09@gmail.com>
Date:   Wed, 10 May 2023 07:43:25 -0700
Message-ID: <CABeZed7eVgREt4osqeMzVuuDy603jQNiA2_BewSMaEU+1Y+SXg@mail.gmail.com>
Subject: from nina coulibaly
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Dear,

I am interested to invest with you in your country with total trust
and i hope you will give me total support, sincerity and commitment.
Please get back to me as soon as possible so that i can give you my
proposed details of funding and others.

Best Regards.

Mrs Nina Coulibaly
