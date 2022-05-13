Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76BBC525D81
	for <lists+linux-i2c@lfdr.de>; Fri, 13 May 2022 10:38:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356303AbiEMIcZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 13 May 2022 04:32:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241051AbiEMIcY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 13 May 2022 04:32:24 -0400
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com [IPv6:2607:f8b0:4864:20::e31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB74E62A00
        for <linux-i2c@vger.kernel.org>; Fri, 13 May 2022 01:32:22 -0700 (PDT)
Received: by mail-vs1-xe31.google.com with SMTP id y74so7671877vsy.7
        for <linux-i2c@vger.kernel.org>; Fri, 13 May 2022 01:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=SUWQMmwZSct1NUq5pHL/uGOr0m/f9iWjJQkP63QJuAY=;
        b=fc/T5NG9JRA7AXUZbvqYt8UJhzaqABFfnPhhtSQOxDrV/XfuL919TNbOEzvFofShzW
         3liF2OYgEmwCri+fdWLHSxysG14KvQ9xOKtLhOBBxZR5P+vM6Orzmj0zFelIvzl491UH
         hI80Xqk8HvOgZG28/XN3ggl6iw0U/7iC6ImnLy0GID0oQXZLlA2JmvfCfJ4XdgKCZhO0
         9f6uq5xeEeF67X3LObvYI7zNOBenPLz26UIr6Z0n6Ehgpvp6jiQsVGuEsK/taRc3EaCq
         RaIf12KhP5OpMnwaoZOcx89TyfmPM+8xir+ebcAyJLrkrxM1YHZ2InZadQcNcIp1AiLz
         10Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=SUWQMmwZSct1NUq5pHL/uGOr0m/f9iWjJQkP63QJuAY=;
        b=pc9NN7KQPGk7VhLiyZujQdGXcss5ScCkY4SHMQqpp9U0jiImfDdlT3LEeMK+dGbE/4
         QhdZtCVJjoA7StwQr+r8ssVlg/NA/m9Nlr6aa+YvDD+cOlimhEg/hD6YD6Ecnh7nrrMf
         9oFMmoh4tK4l6GfUUAjDli4yNQLha/zVYw3DAA3PPtESuX5mPWoI0S1HMgD5qiYze+fg
         1gEHu4FILsyHTc4U/3seRDYmTEpkXwHqAZQkzhBQN+7O5W+VTYZzsqESAFcjkfHMdUP4
         sLCFabxqJinUxKRYUgfgF6dk7aT2AljVgZLCcudrheUwWKYi8ULo3pq6tFK1wcMH4Juy
         /Zug==
X-Gm-Message-State: AOAM531J9Joiwm4LMuBuP5srpznyKc/yGpao1VcqAR07ieLFNrKdF862
        LVv1jKDcgTR8xHgn3PkfSSi0+79Je/j2jCSAdIA=
X-Google-Smtp-Source: ABdhPJx7Y7PzOSrYHgH4giSxqgK/EXD2sZEblvcj+nyobCw45yfMvfuegRyeroFvQR4IaGa/6NpGAFNWwyeTwpjazag=
X-Received: by 2002:a67:1a02:0:b0:320:a51f:8067 with SMTP id
 a2-20020a671a02000000b00320a51f8067mr2020787vsa.38.1652430741893; Fri, 13 May
 2022 01:32:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:612c:1095:b0:2ba:f7f:f651 with HTTP; Fri, 13 May 2022
 01:32:21 -0700 (PDT)
Reply-To: jub47823@gmail.com
From:   Julian Bikarm <kodjoafanou2001@gmail.com>
Date:   Fri, 13 May 2022 08:32:21 +0000
Message-ID: <CALgh3e=VaySLLsOW0LFNWmkxquy4mkewecKteQ-051PLQEOLAw@mail.gmail.com>
Subject: Please can i have your attention
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:e31 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4992]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [kodjoafanou2001[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [kodjoafanou2001[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [jub47823[at]gmail.com]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.5 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Dear ,


Please can I have your attention and possibly help me for humanity's
sake please. I am writing this message with a heavy heart filled with
sorrows and sadness.

Please if you can respond, i have an issue that i will be most
grateful if you could help me deal with it please.

Julian
