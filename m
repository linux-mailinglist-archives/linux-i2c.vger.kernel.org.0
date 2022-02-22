Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 964224C0217
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Feb 2022 20:34:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230467AbiBVTed (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Feb 2022 14:34:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230486AbiBVTec (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 22 Feb 2022 14:34:32 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 455EA2AD8
        for <linux-i2c@vger.kernel.org>; Tue, 22 Feb 2022 11:34:06 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id n18-20020a05600c4f9200b003806ce86c6dso2741500wmq.5
        for <linux-i2c@vger.kernel.org>; Tue, 22 Feb 2022 11:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:from:mime-version:content-transfer-encoding
         :content-description:subject:to:date:reply-to;
        bh=FyG0ATSkb5fmrso4VuDc0KiEUJrvvMWML2pstdAYUxY=;
        b=G6145JLNJ8DZV5xDeWFgz4r/ogGp4QySyYvEy+X3DSk0j4W2YIJt+g0tkOBLPuEWUw
         sBjgAl/o3DFvK9RIFJzMVrGNu2aoWGo9z4cXnNRuDZNvbeA6IWOstSJOIhxSqTXrPyDv
         aNj3JFlJz2Oc9IA6XudeYKpCZFFtnRRsL6ON48AvtOqghtUNypmwowPTb+bepj7CQSbJ
         2fQ/yd2VOTN5q2Zv6VqMs1rEScurmoClR0qG4I1EVp9z2XAZ3Rxd/PM4/Fl3jK8B7EOr
         BXaKHdyW/Dj+/C3DhR6JbmREvwC9W+q65vQkeyw9nZrbu9KuLKHML8uCeURxAtAkgmGh
         miKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:from:mime-version
         :content-transfer-encoding:content-description:subject:to:date
         :reply-to;
        bh=FyG0ATSkb5fmrso4VuDc0KiEUJrvvMWML2pstdAYUxY=;
        b=ApIrYbDjiXHdXkv+R3qmbPFPq25XvyeFOiNGbMH83SVbiJZ6F26MUCThv7gZfI24yl
         W8nmWBoWoYzHiOEueXqvaPvkuCkfJyCDbmI+74Q33dAU/V8zs0mfcfa/ZUndmmPWCkXc
         UR++VJTK31dsdmp2OLIY8S6K8iXN3HPlSrEvzeyOU/rwWlYl2/N/AWlhY+LlyMlStJf6
         Px5qCnxoCKCxLlMlK0ddTzzEfHOvYY4Qpf5bkslPTJg1QITfpFcxt2WIk325AAhlX0ta
         h/sQ7Qlp6wvDyF7HcGsfkNuUtT8m38NnLHQ+5SW5YJjOjYRUwotjCAaS8VSEEUCkHxT7
         xtcg==
X-Gm-Message-State: AOAM531euUA/kcVKlHfVKtubuHikh/adWI+yF5AlYTzO5g1E1CjZXAB5
        hJVlBhWE6UE3OjC23PEZN/I=
X-Google-Smtp-Source: ABdhPJz6trf4IyhMdjn73ZmgTyF/ZMMzD9kwaWoFkttF/ZXyDmtutqo/1a9a+QBU5lEy6TqfsWHtIA==
X-Received: by 2002:a05:600c:3b1d:b0:37c:2d38:945e with SMTP id m29-20020a05600c3b1d00b0037c2d38945emr4753699wms.60.1645558444879;
        Tue, 22 Feb 2022 11:34:04 -0800 (PST)
Received: from [192.168.0.133] ([5.193.8.34])
        by smtp.gmail.com with ESMTPSA id az7sm3987012wmb.14.2022.02.22.11.34.00
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Feb 2022 11:34:04 -0800 (PST)
Message-ID: <62153aac.1c69fb81.12f8f.ea83@mx.google.com>
From:   Mrs Maria Elisabeth Schaeffler <dr5mike77@gmail.com>
X-Google-Original-From: Mrs Maria Elisabeth Schaeffler
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Spende
To:     Recipients <Mrs@vger.kernel.org>
Date:   Tue, 22 Feb 2022 23:33:56 +0400
Reply-To: mariaeisaeth001@gmail.com
X-Spam-Status: No, score=2.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,TO_MALFORMED,T_HK_NAME_FM_MR_MRS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hallo,

Ich bin Frau Maria Elisabeth Schaeffler, eine deutsche Wirtschaftsmagnatin,=
 Investorin und Philanthropin. Ich bin der Vorsitzende von Wipro Limited. I=
ch habe 25 Prozent meines pers=F6nlichen Verm=F6gens f=FCr wohlt=E4tige Zwe=
cke ausgegeben. Und ich habe auch versprochen zu geben
der Rest von 25% geht dieses Jahr 2021 an Einzelpersonen. Ich habe mich ent=
schlossen, Ihnen 1.500.000,00 Euro zu spenden. Wenn Sie an meiner Spende in=
teressiert sind, kontaktieren Sie mich f=FCr weitere Informationen.

Sie k=F6nnen auch =FCber den untenstehenden Link mehr =FCber mich lesen


https://en.wikipedia.org/wiki/Maria-Elisabeth_Schaeffler

Sch=F6ne Gr=FC=DFe
Gesch=E4ftsf=FChrer Wipro Limited
Maria-Elisabeth_Schaeffler
Email: mariaeisaeth001@gmail.com=20
