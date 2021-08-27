Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 558973F9C3A
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Aug 2021 18:14:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245535AbhH0QO6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 27 Aug 2021 12:14:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245525AbhH0QO5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 27 Aug 2021 12:14:57 -0400
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1A11C061757
        for <linux-i2c@vger.kernel.org>; Fri, 27 Aug 2021 09:14:08 -0700 (PDT)
Received: by mail-io1-xd2a.google.com with SMTP id a13so9166544iol.5
        for <linux-i2c@vger.kernel.org>; Fri, 27 Aug 2021 09:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=+Vty3BQ9id14poL1IzVtbLeHzxb61fis97WkWjUQWcI=;
        b=EdsC5xlplPaHfcNRwxhah3Vz4QsF83o95uwh0kmIItHwQ1W8xeo1JkhEbrZF4bTq1k
         LEjsdN+3swYkyyJXzkgtvEa6Jd9xMj8/ubcsOXfRw2AUpX7A/qnZDUShRPY3fF5tQQ6n
         NrxzTDNdLrb38k0Itnu3nvuvYMYSyLbmc2wz1311icURXJ3zZpp+W86ugATbkUi0AFYP
         12tyBm22rpEvvn3RqQrNXQZhcfyJ2qv9pRSxuTLzuBd4UGpDyWSpewx8z01oP4C2qsB8
         XxiOwmahdEw7hU6GNVGEN+RFdXXjORwYhRVDB0wNapv1PKgDyJANLoxd3ZfaF8HBd5bS
         ba3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=+Vty3BQ9id14poL1IzVtbLeHzxb61fis97WkWjUQWcI=;
        b=WAlZkJt3JHNvxBpE+9770Dabh43EfJ58W8l5JD4jMGKHtdiHX3Jo2foYtxOUE7u8Vo
         znc7IqbwzydO4gWlND6hSXFJj1A3E+xnQMDKVXi9vN8Hij/CpmbXMcVjx6jSqWe+NfEf
         wnoq7VK+hNM6ymVZFGB9pcwsDrW8cCZo31IPEFnSTvED/FUV1hI7WEDgrCcID5GUS+8Y
         dsPsyZqhvECzwina1YvEhMORCI8w8M/NBQHAi8ysZDfiuZPBhzndDTvLZEUZIJCH9T8L
         F7o5U8PTleBUXsFAzbtsbwTFxn2UTwoMLEGxIHqSkkzfKeze1zhQl4G5MNBvzMz7NFzG
         sj7w==
X-Gm-Message-State: AOAM531djuyPZ1atQWm5hQGKwKJGMjiuqLPXuV1peWlnDSJEx2o262HI
        gxGGmkRiZU09LA23S8DbRyiuYXQ3p9LYqX9sKUk=
X-Google-Smtp-Source: ABdhPJw5CyveDdc93f0sWNi63BBBgGQUDS4f1EspBeOrmMzcqLD2Iit4Fn0mUqUk01c/0iD9uGMKm8T2roMp5SyYWS0=
X-Received: by 2002:a05:6602:2001:: with SMTP id y1mr8132646iod.97.1630080848079;
 Fri, 27 Aug 2021 09:14:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a92:d9c5:0:0:0:0:0 with HTTP; Fri, 27 Aug 2021 09:14:06
 -0700 (PDT)
Reply-To: jesspayne72@gmail.com
From:   Jess Payne <misslinnea88@gmail.com>
Date:   Fri, 27 Aug 2021 09:14:06 -0700
Message-ID: <CACUD9YpgVyMbmuVPgPecTM1hLtXQeTzVgCKa76ctRBqrfdudWw@mail.gmail.com>
Subject: =?UTF-8?B?5oiR6ZyA6KaB5L2g55qE5biu5YqpIC8gSSBuZWVkIHlvdXIgYXNzaXN0YW5jZQ==?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

5oiR5piv5p2w6KW/5L2p5oGp5Lit5aOr5aSr5Lq644CCDQoNCuWcqOe+juWbvemZhuWGm+eahOWG
m+S6i+mDqOmXqOOAgue+juWbve+8jOS4gOWQjeS4reWjq++8jDMyIOWyge+8jOaIkeWNlei6q++8
jOadpeiHque+juWbveeUsOe6s+ilv+W3nuWFi+WIqeWkq+WFsO+8jOebruWJjempu+aJjuWcqOWI
qeavlOS6muePreWKoOilv++8jOS4juaBkOaAluS4u+S5ieS9nOaImOOAguaIkeeahOWNleS9jeaY
r+esrDTmiqTnkIbpmJ/nrKw3ODLml4XmlK/mj7TokKXjgIINCg0K5oiR5piv5LiA5Liq5YWF5ruh
54ix5b+D44CB6K+a5a6e5ZKM5rex5oOF55qE5Lq677yM5YW35pyJ6Imv5aW955qE5bm96buY5oSf
77yM5oiR5Zac5qyi57uT6K+G5paw5pyL5Y+L5bm25LqG6Kej5LuW5Lus55qE55Sf5rS75pa55byP
77yM5oiR5Zac5qyi55yL5Yiw5aSn5rW355qE5rOi5rWq5ZKM5bGx6ISJ55qE576O5Li95Lul5Y+K
5aSn6Ieq54S25omA5oul5pyJ55qE5LiA5YiH5o+Q5L6b44CC5b6I6auY5YW06IO95pu05aSa5Zyw
5LqG6Kej5oKo77yM5oiR6K6k5Li65oiR5Lus5Y+v5Lul5bu656uL6Imv5aW955qE5ZWG5Lia5Y+L
6LCK44CCDQoNCuaIkeS4gOebtOW+iOS4jeW8gOW/g++8jOWboOS4uui/meS6m+W5tOadpeeUn+a0
u+WvueaIkeS4jeWFrOW5s++8m+aIkeWkseWOu+S6hueItuavje+8jOmCo+W5tOaIkSAyMQ0K5bKB
44CC5oiR54i25Lqy55qE5ZCN5a2X5piv5biV54m56YeM5pav5L2p5oGp77yM5oiR55qE5q+N5Lqy
5piv546b5Li95L2p5oGp44CC5rKh5pyJ5Lq65biu5Yqp5oiR77yM5L2G5b6I6auY5YW05oiR57uI
5LqO5Zyo576O5Yab5Lit5om+5Yiw5LqG6Ieq5bex44CCDQoNCuaIkee7k+WpmueUn+S6huWtqeWt
kO+8jOS9huS7luatu+S6hu+8jOS4jeS5heaIkeS4iOWkq+W8gOWni+asuumql+aIke+8jOaJgOS7
peaIkeS4jeW+l+S4jeaUvuW8g+WpmuWnu+OAgg0KDQrmiJHkuZ/lvojlubjov5DvvIzlnKjmiJHn
moTlm73lrrbnvo7lm73lkozliKnmr5Tkuprnj63liqDopb/ov5nph4zmi6XmnInmiJHnlJ/mtLvk
uK3miYDpnIDnmoTkuIDliIfvvIzkvYbmsqHmnInkurrkuLrmiJHmj5Dkvpvlu7rorq7jgILmiJHp
nIDopoHkuIDkuKror5rlrp7nmoTkurrmnaXkv6Hku7vvvIzlubbkuJTku5bov5jkvJrlu7rorq7m
iJHlpoLkvZXmipXotYTmiJHnmoTpkrHjgILlm6DkuLrmiJHmmK/miJHniLbmr43lnKjku5bku6zl
jrvkuJbliY3nlJ/kuIvnmoTllK/kuIDkuIDkuKrlpbPlranjgIINCg0K5oiR5LiN6K6k6K+G5L2g
5pys5Lq677yM5L2G5oiR6K6k5Li65pyJ5LiA5Liq5YC85b6X5L+h6LWW55qE5aW95Lq677yM5LuW
5Y+v5Lul5bu656uL55yf5q2j55qE5L+h5Lu75ZKM6Imv5aW955qE5ZWG5Lia5Y+L6LCK77yM5aaC
5p6c5L2g55yf55qE5pyJ5LiA5Liq6K+a5a6e55qE5ZCN5a2X77yM5oiR5Lmf5pyJ5LiA5Lqb5Lic
6KW/6KaB5ZKM5L2g5YiG5Lqr55u45L+h44CC5Zyo5L2g6Lqr5LiK77yM5Zug5Li65oiR6ZyA6KaB
5L2g55qE5biu5Yqp44CC5oiR5oul5pyJ5oiR5Zyo5Yip5q+U5Lqa54+t5Yqg6KW/6L+Z6YeM6LWa
5Yiw55qE5oC76aKd77yIMjUwDQrkuIfnvo7lhYPvvInjgILmiJHkvJrlnKjkuIvkuIDlsIHnlLXl
rZDpgq7ku7bkuK3lkYror4nkvaDmiJHmmK/lpoLkvZXlgZrliLDnmoTvvIzkuI3opoHmg4rmhYzv
vIzku5bku6zmsqHmnInpo47pmanvvIzogIzkuJTmiJHov5jlnKjkuI4gUmVkDQrmnInogZTns7vn
moTkurrpgZPkuLvkuYnljLvnlJ/nmoTluK7liqnkuIvlsIbov5nnrJTpkrHlrZjlhaXkuobpk7bo
oYzjgILmiJHluIzmnJvmgqjlsIboh6rlt7HkvZzkuLrmiJHnmoTlj5fnm4rkurrmnaXmjqXmlLbl
n7rph5HlubblnKjmiJHlnKjov5nph4zlrozmiJDlkI7noa7kv53lroPnmoTlronlhajlubbojrfl
vpfmiJHnmoTlhpvkuovpgJrooYzor4Hku6XlnKjmgqjnmoTlm73lrrbkuI7mgqjkvJrpnaLvvJvk
uI3opoHlrrPmgJXpk7booYzkvJrlsIbotYTph5HlrZjlgqjlnKgNCkFUTSBWSVNBIOWNoeS4re+8
jOi/meWvueaIkeS7rOadpeivtOaYr+WuieWFqOS4lOW/q+aNt+eahOOAgg0KDQrnrJTorrA75oiR
5LiN55+l6YGT5oiR5Lus6KaB5Zyo6L+Z6YeM5ZGG5aSa5LmF77yM5oiR55qE5ZG96L+Q77yM5Zug
5Li65oiR5Zyo6L+Z6YeM5Lik5qyh54K45by56KKt5Ye75Lit5bm45a2Y5LiL5p2l77yM6L+Z5L+D
5L2/5oiR5a+75om+5LiA5Liq5YC85b6X5L+h6LWW55qE5Lq65p2l5biu5Yqp5oiR5o6l5pS25ZKM
5oqV6LWE5Z+66YeR77yM5Zug5Li65oiR5bCG5p2l5Yiw5L2g5Lus55qE5Zu95a625Ye66Lqr5oqV
6LWE77yM5byA5aeL5paw55Sf5rS777yM5LiN5YaN5b2T5YW144CCDQoNCuWmguaenOaCqOaEv+aE
j+iwqOaFjuWkhOeQhu+8jOivt+WbnuWkjeaIkeOAguaIkeS8muWRiuivieS9oOS4i+S4gOatpeea
hOa1geeoi++8jOW5tue7meS9oOWPkemAgeabtOWkmuWFs+S6juWfuumHkeWtmOWFpemTtuihjOea
hOS/oeaBr+OAguS7peWPiumTtuihjOWwhuWmguS9leW4ruWKqeaIkeS7rOmAmui/hyBBVE0gVklT
QQ0KQ0FSRCDlsIbotYTph5Hovaznp7vliLDmgqjnmoTlm73lrrYv5Zyw5Yy644CC5aaC5p6c5L2g
5pyJ5YW06Laj77yM6K+35LiO5oiR6IGU57O744CCDQo=
