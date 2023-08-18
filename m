Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC0027807C7
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Aug 2023 11:02:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358908AbjHRJC0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Aug 2023 05:02:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359003AbjHRJCT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Aug 2023 05:02:19 -0400
X-Greylist: delayed 1502 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 18 Aug 2023 02:01:56 PDT
Received: from mail.leachkin.pl (mail.leachkin.pl [217.61.97.203])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB3394223
        for <linux-i2c@vger.kernel.org>; Fri, 18 Aug 2023 02:01:56 -0700 (PDT)
Received: by mail.leachkin.pl (Postfix, from userid 1001)
        id C4B5C848DE; Fri, 18 Aug 2023 09:16:36 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leachkin.pl; s=mail;
        t=1692346614; bh=elHzctRz/z3PfTIhGYJKd0TeBTmca98Y+JNgX4gfsPI=;
        h=Date:From:To:Subject:From;
        b=DctgpmJp2dVq2Lrj3CpdEgLS7r2jtxakId7SHz31iN2CBsNOS7QIabMrlmdQVJhFU
         Q7LneDiLInawhfLxy2yejKSk2RCxzbCg5yQNX+dkN7Hxcx2QzkninV2wIf4nG54EEA
         lJuBfHg93QTqFBSIXg1VaXEq/CxOJfxb99JAcGyOuRQQqAfZ1vI7xNJwRyxmwIGemC
         BkO/CDWeieXg5UhC3cLDJ4ZNxGqEAp+AG2nBkPuOtYRo71HyA3WbR91mfMIpFbf/kn
         aQBiqGkuvh7YOv0w8wJ8IDaRa8mmgLqt6eLWt7TgRqa9U2SmcXnvK6DrcD/bmW86KC
         ly/zS5t7TfUKA==
Received: by mail.leachkin.pl for <linux-i2c@vger.kernel.org>; Fri, 18 Aug 2023 08:15:51 GMT
Message-ID: <20230818074501-0.1.4u.cufx.0.x3ik75jrmr@leachkin.pl>
Date:   Fri, 18 Aug 2023 08:15:51 GMT
From:   "Jakub Lemczak" <jakub.lemczak@leachkin.pl>
To:     <linux-i2c@vger.kernel.org>
Subject: =?UTF-8?Q?Pytanie_o_samoch=C3=B3d?=
X-Mailer: mail.leachkin.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=1.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_VALIDITY_RPBL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Dzie=C5=84 dobry,

Czy interesuje Pa=C5=84stwa rozwi=C4=85zanie umo=C5=BCliwiaj=C4=85ce moni=
torowanie samochod=C3=B3w firmowych oraz optymalizacj=C4=99 koszt=C3=B3w =
ich utrzymania?=20


Pozdrawiam,
Jakub Lemczak
