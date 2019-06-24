Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16F9D504FF
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jun 2019 10:59:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725916AbfFXI7U (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Jun 2019 04:59:20 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:55623 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726557AbfFXI7U (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Jun 2019 04:59:20 -0400
Received: from [192.168.1.110] ([77.4.138.202]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MJVY8-1hzD7W12sq-00JruV; Mon, 24 Jun 2019 10:59:18 +0200
Subject: Re: [PATCH 1/3] include: linux: i2c: more helpers for declaring i2c
 drivers
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     "Enrico Weigelt, metux IT consult" <info@metux.net>,
        linux-kernel@vger.kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <1560796779-17117-1-git-send-email-info@metux.net>
 <20190621211744.GC950@kunai> <c669a041-f025-693a-492a-80ce888db737@metux.net>
 <20190624084427.GA1014@kunai>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <205d0ef7-d487-006b-d104-88958f40e197@metux.net>
Date:   Mon, 24 Jun 2019 10:59:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190624084427.GA1014@kunai>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:kVx291ZekfkMnc6WJzsoAVGadykZkXcOImRJ4KvFPHdNlmO8X/w
 wDVWLmsrflIK8awd/K9cSRQ18j/vONP/bvXB6ZqUdqjmZFLoJdqpR8zsfGxyUYPo7aw5OTq
 JTWaPVTxkWAt9RDtJ8x+xcczZqZUYacyI6ljlgrQfbl6e+VfRyuU605WdSdh2P1L53dnNHb
 oBmbyA1UGpa/KoX9vsv5w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:swNYtjFfWCA=:Jx2Lqwjcro1pBpKYHO0/pU
 +A1W/g1q42uZpjEit3HRp0zwiLLJHbmGa6ZR56uXgJ90ynEVvLvx0SFGfGQEIfpt7msP05TRu
 hR/qwuHAVkYCmAL3G+ZOc1DK5zK88e2bUgZRsLDIQgk1Lxj+RYm73fx5BRtTE/zl+IkIDYPdx
 taT4jr067Tw76Ht39NXb1Are5dq69lwUM79TqytyRbBY/2SBjQM172VjXJ28UG2AezM/qmVGY
 1okO761KsA9gewuK58pamhxz3zfrTGC1CUc6dPCKt7i49JXHWSBi5D0qI9fpgjlOYcl4xvOc1
 /c/MwWmVgGuTUjQM5z7r+QIGbmoN2Kuwv4jobmMwyWlcL/NtyGfSErZ51YluK8tF5fyoxw7uq
 creyd+1iDAJYEGPk6gANoiqV8iubpjtbkG6WD/kF55tZxIXeN5G7Zl9RXCNZQYUvctTce9jVp
 PYQLXfeGasLg39y/FEj5oIS+OTZn4zgFqvYxrRQw5P4bngTRYqdRVCbleM7BN7WTJrwBCNCb3
 6hs/p34Ores8bYLoboOzauGD/XktVcuNQJ1ZuOQSjbkTq5bD1DZ02+VNCM0HePYvOwDeJmLWu
 29Z7fd77nF8MOzTFPxKbfSg8L6suqRslFE0Z5cOLoZT7TG3nb3h0C+znK0yylVkiucSH/aJ++
 v+pIMbLe6iIhaIp2osaPIs1HzpTFQN/CSMCLYEQ7AgHtXG3WmtIDGYhqxC3PoEff2yehi8/Lx
 YBmCLnZ0D49Mk6dGlEqOt7iBMaY9KvJwvD6X36Q7qIw9xLjD0cKiSfEP16g=
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 24.06.19 10:44, Wolfram Sang wrote:

> The correct solution is to fix the boot dependency in the affected I2C
> client drivers. That definately needs HW and thorough testing.
> 
> It may also need something better than the current deferred probe. Big
> topic.

So, then the current approach of using subsys_initcall() can't be
changed easily, right now. But planned for the future (or at least
not introducing new caes).

But: how does that conflict w/ just moving the existing redundant
pieces into a helper macro ? The logic stays the same - just using
a shorter notation. (assuming my patch isn't buggy ;-)).

I can add a remark in the function documentation that this shall
only by used in rare cases, and maybe something like "that's just
legacy  - introducing  new caller is most certainly wrong" ;-)


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
