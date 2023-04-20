Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B55EA6E9729
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Apr 2023 16:32:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231706AbjDTOcr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Apr 2023 10:32:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231690AbjDTOco (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 Apr 2023 10:32:44 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 121B046A2;
        Thu, 20 Apr 2023 07:32:38 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id vc20so6768648ejc.10;
        Thu, 20 Apr 2023 07:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682001156; x=1684593156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4BzOx6++HBX7ZigSvnuC48ImXTD2NnsgoKKAOBGKgzo=;
        b=N3KF6WZtB5Gz0f85pp7xeV1/u+Hw7t+ryYQ4wgm51aek9PbNozPg/4pO3zpkRIQy/s
         OxEHfWX8zMlO7E54j/onlmOSqOE3RbEP1qSfnx7P/zFXlz4hD2yjN1HqEiSjOKclUMbK
         GoDz0bTE2uAS6zhQy4OGBJ0Yl7ZIIX0f2MuR54QleaJrvrT8o7p8vE9LljDyx+bMMZW9
         PWHM8tMNU6KraWtbiTuWlPwpTWQqlD/QnI6L36NBbbUN6HJ0YOW+ljHKDgd/7tvyf21S
         1y28ZgAp58Ir07DVt+Gn4PwK0yq6DV9GrHW9nEHaQXJPL9/m168FGG4PW0KqaY1qvwpo
         wUXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682001156; x=1684593156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4BzOx6++HBX7ZigSvnuC48ImXTD2NnsgoKKAOBGKgzo=;
        b=kt6vQtm5dMfuJgan/12/JZjelYq6wNKE+Ip8zeh9amvaTRozD3dx8sB6chOiLNCsgx
         wItzbNT5qcH2DwRZXwCF170uus7kR9VQ3FKGmMB666HJ+XAOeiHFvF7TMWOqaNQ+6nDq
         E75IUnfQOE8VYNJSmUQmL2sAgvYuAprZ0ZyIf0DTDQqcQfipzyLQgY9MuLP1jAeMz89o
         MnDX1QINQfyAYV0o9Nb685M0fRQCYKN+UY2hPHyEUTqRP0CLnuBvfZAfe5eCkTI6GnUZ
         ZV2Y5uWIQ2Bp2aeDtlVZpTdibbIcCVZASsQw8/blEmyWSuH9MX9Cf/DDwZym34up7RzK
         yj0A==
X-Gm-Message-State: AAQBX9f5aKi7rKhQYyAUaqmliqM/jv5/Yjk9bHFxKjyDb4EKxn/iAmuD
        vBBsGNWW5MaRBCc1dLmj0ouBWJtcxCw0NBc5
X-Google-Smtp-Source: AKy350YW6KyCShN/KBSTBQV6SxvPNuRoMYkOF2Ebgt5nZ1ewg07568dpzitDHUtDUOcCBro65cEKpw==
X-Received: by 2002:a17:906:b0e:b0:94f:2840:14c9 with SMTP id u14-20020a1709060b0e00b0094f284014c9mr1960741ejg.62.1682001156300;
        Thu, 20 Apr 2023 07:32:36 -0700 (PDT)
Received: from PCBABN.skidata.net ([91.230.2.244])
        by smtp.gmail.com with ESMTPSA id gt11-20020a1709072d8b00b0094f07545d40sm783866ejc.220.2023.04.20.07.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 07:32:36 -0700 (PDT)
From:   Benjamin Bara <bbara93@gmail.com>
To:     lee@kernel.org
Cc:     bbara93@gmail.com, benjamin.bara@skidata.com,
        dmitry.osipenko@collabora.com, jonathanh@nvidia.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, peterz@infradead.org,
        rafael.j.wysocki@intel.com, richard.leitner@linux.dev,
        treding@nvidia.com, wsa@kernel.org
Subject: Re: [PATCH v5 6/6] mfd: tps6586x: register restart handler
Date:   Thu, 20 Apr 2023 16:32:29 +0200
Message-Id: <20230420143229.541283-1-bbara93@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230420140406.GH996918@google.com>
References: <20230420140406.GH996918@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Thanks for the feedback!

On Thu, 20 Apr 2023 at 16:04, Lee Jones <lee@kernel.org> wrote:
> Why 20 here and 50 in the other patch?

The data sheet states:
The device will enter the SLEEP or HARD REBOOT state 10ms after the
SLEEP REQUEST or REBOOT REQUEST is initiated.

Also:
When the reboot request state is set an internal timer TWAIT (10ms typ)
is started (...). The reboot request ends when t > TWAIT.

But in the electrical characteristics, TWAIT is given as min 18, typ 20,
max 22.

In my observations, reboot took like typ 15ms and sleep typ 25ms, but
this might be very board-specific. I can set both to 50ms to be "on the
safe side" and have a common value?

Thanks and best regards,
Benjamin
